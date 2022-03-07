#!/usr/bin/env python3
import smtplib
import time
import sys
import os
import re 

def send_email(receivers:[str],text:str):
    assert type(text)==str
    assert type(receivers[0])==str
    assert len(text)<160
    with smtplib.SMTP_SSL("smtp.gmail.com",465) as smtp:
        sender="manrrs.outreach@gmail.com"
        smtp.login(sender,"shbchjsacb7382y2%")
        msg="Subject: _ \n\n"+text
        smtp.sendmail(sender,receivers,msg)

complete_carrier_domains=["sms.alltelwireless.com","txt.att.net","sms.myboostmobile.com","mms.cricketwireless.net","mymetropcs.com","text.republicwireless.com","messaging.sprintpcs.com","tmomail.net","email.uscc.net","vtext.com","vmobl.com"]
carrier_domains=["tmomail.net","txt.att.net","vtext.com"]


#works on my phone ["mymetropcs.com","tmomail.net","vmobl.com"]

def send_text(numbers:[str],domains:[str],text:str):
    assert type(text)==str
    assert type(numbers[0])==str
    assert type(domains[0])==str
    email_addrs=[]
    for num in numbers:
        for cd in domains:
            email_addrs.append(num+"@"+cd)
    print(email_addrs)
    send_email(email_addrs,text)



"""
Alltel                  sms.alltelwireless.com  
AT&T                    txt.att.net 
Boost Mobile            sms.myboostmobile.com   
Cricket Wireless        mms.cricketwireless.net 
MetroPCS                mymetropcs.com  
Republic Wireless       text.republicwireless.com   
Sprint                  messaging.sprintpcs.com 
T-Mobile                tmomail.net
U.S. Cellular           email.uscc.net
Verizon Wireless        vtext.com   
Virgin Mobile           vmobl.com   
""" 

def sql_exec(query:str):
    assert type(query)==str
    db_usr="gyuphobxyrglnx" 
    db_pwd="6266bef5056bb59d2bba8fd3a50fc30987795a2004a3d38bd1ce8321e5e3166f"
    db_name="dfq39rnativju7"
    db_domain="ec2-54-209-221-231.compute-1.amazonaws.com"
    #setting up a .pgpass file to prevent psql from pompting us for a password
    os.system('echo \''+db_domain+':*:'+db_name+':'+db_usr+':'+db_pwd+'\' > ~/.pgpass')
    #psql expects .pgpass to have the following permissions
    os.system('chmod 0600 ~/.pgpass')
    #pipe the query into psql and write the result to a temporary file
    with open("/tmp/query.sql","w") as fd:
        fd.write(query)
    os.system('psql -f /tmp/query.sql -h '+db_domain+' -U '+db_usr+' '+db_name+' > /tmp/tmp_query')
    raw=""
    with open("/tmp/tmp_query") as fd:
        #read the query result from the temporary file
        raw=fd.read()
    return raw


def sql_get_numbers():
    query='select * from students'
    raw=sql_exec(query)
    #extract 10 digit numbers and put them in an array
    return re.findall(r'\b\d\d\d\d\d\d\d\d\d\d\b',raw)

def sql_add_number(number:str):
    assert type(number)==str
    query="insert into students values(0,null,null,null,"+number+",null,NOW(),NOW())"
    raw=sql_exec(query)
    return re.findall(r'\b\d\d\d\d\d\d\d\d\d\d\b',raw)


def sql_set_carriers(domains:[str]):
    assert type(domains[0])==str
    for d in domains:
        query="insert into carriers(domain,created_at,updated_at) values('"
        query+=d
        query+="',now(),now());"
        sql_exec(query)
    

def sql_get_carriers():
    query='select domain from carriers' 
    raw=sql_exec(query)
    #extract domain names and put them in an array
    return re.findall(r'\b[a-z]+(?:\.[a-z]+)+\b',raw)


def sql_get_student_ids():
    query='select id from students'
    raw=sql_exec(query)
    nums=re.findall(r'\b\d+\b',raw)
    if len(nums)>1: del nums[-1]
    return nums;

def sql_get_max_message_id():
    query='select max(id) from messages'
    raw=sql_exec(query)
    arr=re.findall(r'\b\d+\b',raw)[0]
    if len(arr)==0: return 0
    return arr


def sql_store_msg(msg:str,admin_id:str):
    assert type(msg)==str 
    assert type(admin_id)==str 
    msg=msg.replace("'","")
    query="insert into messages(admin_id,text,date_created,created_at,updated_at) values('"+admin_id+"','"+msg+"',NOW(),NOW(),NOW());"
    sql_exec(query)
    query3="insert into message_histories (message_id, date_sent, student_id, created_at, updated_at) "
    query3+="values('"+str(int(sql_get_max_message_id()))+"', NOW(), '"
    query3+=str(sql_get_student_ids()).replace(' ','').replace('[','').replace(']','').replace('\'','').replace('{','').replace('}','')
    query3+="', NOW(), NOW());"
    sql_exec(query3)

def sql_get_messages():
    query='select text from messages'
    return sql_exec(query)


def test():
    # send_text(["3463328947"],["tmomail.net"],"auto test msg")
    msg="3872ehdiwdnwuiqy3eq"
    sql_store_msg(msg,"1")
    raw=sql_get_messages()
    assert msg in raw
    #clean up
    sql_exec("delete from messages where text='"+msg+"';")
    number="1234567890"
    sql_add_number(number)
    nums=sql_get_numbers()
    found=False;
    for num in nums:
        if num==number:
            found=True
            break
    assert found
    sql_exec("delete from students where id=0;")
    sql_exec("delete from carriers where 1=1;")
    sql_set_carriers(carrier_domains)
    cds=sql_get_carriers()
    assert cds[0]==carrier_domains[0]
    assert cds[1]==carrier_domains[1]
    assert cds[2]==carrier_domains[2]


def main():
    print("ZZZZZZZZZ: send_text.py")
    assert len(sys.argv)>=2

    if sys.argv[1]=="test":
        test()
        return

    admin_id="0"
    if len(sys.argv)==3: 
        with open(sys.argv[2]) as fd:
            admin_id=fd.read()
        
    msg=""
    with open(sys.argv[1]) as fd:
        msg=fd.read()
    if len(msg)==0:
        return
    
    cds=sql_get_carriers()
    if len(cds)==0: sql_set_carriers(carrier_domains)
    
    sql_store_msg(msg,admin_id)
    send_text(sql_get_numbers(),sql_get_carriers(),msg)
    


if __name__ == '__main__':
    main()


