
import sqlite3
import pymysql
import time
import threading 
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)
GPIO.setwarnings(False)

A = 7
B = 11
C = 13
D = 15

E = 8
F = 12
G = 18
H = 16

GPIO.setup(A, GPIO.OUT)
GPIO.setup(B, GPIO.OUT)
GPIO.setup(C, GPIO.OUT)
GPIO.setup(D, GPIO.OUT)



GPIO.setup(E, GPIO.OUT)
GPIO.s
etup(F, GPIO.OUT)
GPIO.setup(G, GPIO.OUT)
GPIO.setup(H, GPIO.OUT)


"""
      1  2  3  4  5  6  7  8

Pin1  x  x                 x
Pin2     x  x  x
Pin3           x  x  x
Pin4                 x  x  x

"""

def GPIO_SETUP_1(a,b,c,d):
    GPIO.output(A, a)
    GPIO.output(B, b)
    GPIO.output(C, c)
    GPIO.output(D, d)
    time.sleep(0.001)


def GPIO_SETUP_2(e,f,g,h):
    GPIO.output(E, e)
    GPIO.output(F, f)
    GPIO.output(G, g)
    GPIO.output(H, h)
    time.sleep(0.001)

def RIGHT_TURN_1(deg):

    full_circle = 510.0
    degree = full_circle/360*deg
    GPIO_SETUP_1(0,0,0,0)

    while degree > 0.0:
        GPIO_SETUP_1(1,0,0,0)
        GPIO_SETUP_1(1,1,0,0)
        GPIO_SETUP_1(0,1,0,0)
        GPIO_SETUP_1(0,1,1,0)
        GPIO_SETUP_1(0,0,1,0)
        GPIO_SETUP_1(0,0,1,1)
        GPIO_SETUP_1(0,0,0,1)
        GPIO_SETUP_1(1,0,0,1)
        degree -= 1

def LEFT_TURN_1(deg):

    full_circle = 510.0
    degree = full_circle/360*deg
    GPIO_SETUP_1(0,0,0,0)

    while degree > 0.0:
        GPIO_SETUP_1(1,0,0,1)
        GPIO_SETUP_1(0,0,0,1)
        GPIO_SETUP_1(0,0,1,1)
        GPIO_SETUP_1(0,0,1,0)
        GPIO_SETUP_1(0,1,1,0)
        GPIO_SETUP_1(0,1,0,0)
        GPIO_SETUP_1(1,1,0,0)
        GPIO_SETUP_1(1,0,0,0)
        degree -= 1


def RIGHT_TURN_2(deg):

    full_circle = 510.0
    degree = full_circle/360*deg
    GPIO_SETUP_2(0,0,0,0)

    while degree > 0.0:
        GPIO_SETUP_2(1,0,0,0)
        GPIO_SETUP_2(1,1,0,0)
        GPIO_SETUP_2(0,1,0,0)
        GPIO_SETUP_2(0,1,1,0)
        GPIO_SETUP_2(0,0,1,0)
        GPIO_SETUP_2(0,0,1,1)
        GPIO_SETUP_2(0,0,0,1)
        GPIO_SETUP_2(1,0,0,1)
        degree -= 1

def LEFT_TURN_2(deg):

    full_circle = 510.0
    degree = full_circle/360*deg
    GPIO_SETUP_2(0,0,0,0)

    while degree > 0.0:
        GPIO_SETUP_2(1,0,0,1)
        GPIO_SETUP_2(0,0,0,1)
        GPIO_SETUP_2(0,0,1,1)
        GPIO_SETUP_2(0,0,1,0)
        GPIO_SETUP_2(0,1,1,0)
        GPIO_SETUP_2(0,1,0,0)
        GPIO_SETUP_2(1,1,0,0)
        GPIO_SETUP_2(1,0,0,0)
        degree -= 1






def Gate_Close(id):
	print("Exit!")
					RIGHT_TURN_2(90)
					time.sleep(3)
					LEFT_TURN_2(90)
					GPIO_SETUP_2(0,0,0,0)
					cur.execute("UPDATE `parked_vehicles` set departure_time = CURRENT_TIMESTAMP WHERE rfid_no=%s",id)
		       			cur.execute("UPDATE parked_vehicles SET parking_status='Exit' WHERE parked_vehicles.rfid_no=%s",id)
       					cur.execute("INSERT INTO parking_log SELECT subscriber_id,rfid_no,parking_lot_id,entry_gate_id,arrival_time,parking_category,parking_floor_id,parking_slot_id,exit_gate_id,departure_time FROM parked_vehicles WHERE parked_vehicles.rfid_no=%s",id)
					conn.commit()
					time.sleep(10)
					cur.execute("DELETE FROM parked_vehicles WHERE rfid_no=%s",id)
					conn.commit()
 

def Gate_Open(sub_id,id):
	print("Entry!")
       				RIGHT_TURN_1(90)
       				time.sleep(3)
	       			LEFT_TURN_1(90)
       				GPIO_SETUP_1(0,0,0,0)

				#cur.execute("SELECT subscriber_id FROM subscriber_vehicles WHERE rfid_no=%s LIMIT 1",id)
				#sub_id = (cur.fetchone()[0])
				print(sub_id)

	       			qry = "INSERT INTO parked_vehicles (subscriber_id, rfid_no, parking_lot_id, entry_gate_id, arrival_time, parking_category, parking_floor_id, parking_slot_id, exit_gate_id, parking_status) VALUES (%s,%s,111,1,CURRENT_TIMESTAMP, (SELECT parking_category FROM parking_permits WHERE subscriber_id=%s LIMIT 1),0, 1001,9,'Parking')"
       				para = sub_id,id,sub_id
				cur.execute(qry,para)
				conn.commit()

       			#cur.execute("INSERT INTO parked_vehicles (subscriber_id, rfid_no, parking_lot_id, entry_gate_id, arrival_time, parking_category, parking_floor_id, parking_slot_id, exit_gate_id, parking_status) VALUES ((SELECT subscriber_id FROM subscriber_vehicles WHERE rfid_no=%s),%s,'111','1',CURRENT_TIMESTAMP, 'Free','0', '1001','9','Parking')",id,id)
	       			#time.sleep(2)
       				cur.execute("UPDATE parked_vehicles SET parking_status='Parked' WHERE parked_vehicles.rfid_no=%s",id)
				conn.commit()	


def get_parked_vehicle_count(sub_id):
                global  parked_vehicle_cnt
                cur.execute("SELECT COUNT(subscriber_id) FROM parked_vehicles WHERE subscriber_id=%s",sub_id)
				try:
					parked_vehicle_cnt=(cur.fetchone()[0])
				except:
					print("parked vehicle cnt error")
                      
             
            
            
def get_permit_count(sub_id):
                  global permit_cnt
                  cur.execute("SELECT COUNT(subscriber_id) FROM parking_permits WHERE subscriber_id=%s",sub_id)

                  try:
                        permit_cnt=(cur.fetchone()[0])

                  except:
					    print("permit count error")           
    
          
    
    
def get_vehicle_count():
                 global vehicle_cnt
                 cur.execute("SELECT COUNT(rfid_no) FROM subscriber_vehicles WHERE subscriber_id=%s",sub_id)

                 try:
                     vehicle_cnt=(cur.fetchone()[0])

                 except:
				    	print("vehicle count error")
                        
             
             
                

def Check_Permits(sub_id):
                            parked_vehicle_cnt
                            permit_cnt
                            vehicle_cnt            
            
                        	t1 = threading.Thread(target=get_parked_vehicle_count, args=(sub_id,)) 
                            t2 = threading.Thread(target=get_permit_count, args=(sub_id,)) 
                            t3 = threading.Thread(target=get_vehicle_count, args=(sub_id,)) 
			       
                            t1.start()
                            t2.start()
                            t3.start()
                   
                            t1.join()
                            t2.join()
                            t3.join()

            				global flag1
                
            				if((parked_vehicle_cnt) >= (permit_cnt)):
				                         print("SUbscriber does not have enough Permits!!")
					                     message="Sorry!! You dont have enough permits "
                                         qry1="INSERT INTO notify (message, time, subscriber_id) VALUES (%s, now(), %s)"
                                         para1=message,sub_id
                                         cur.execute(qry1,para1)
                                         conn.commit()
                                         flag1=1



def get_parked_veh_count():
        global parked_cnt
        cur.execute("SELECT COUNT(subscriber_id) FROM parked_vehicles WHERE parking_lot_id=111 AND parking_status='Parked'")
		                parked_cnt=(cur.fetchone()[0])
    
    
    
def get_lot_count():
                   global lot_cnt
                   cur.execute("SELECT COUNT(slot_category) FROM parking_floor_layout_slots WHERE slot_category='FCFS' AND parking_lot_id=111")
        		        lot_cnt=(cur.fetchone()[0])
    
    

def Check_Vacancy(sub_id):
                         lot_cnt
                         parked_cnt
        	             global flag2
                        
                         t1 = threading.Thread(target=get_parked_veh_count, args=())
                         t2 = threading.Thread(target=get_lot_count, args=())
                         
                         t1.start()
                         t2.start()
                         
                         t1.join()
                         t2.join()
                        
        		        if(parked_cnt>=lot_cnt):
                		         print('No Available FCFS parking slot!!!')
                        		 message="Sorry!! No FCFS parking slot Available "
                        		 qry1="INSERT INTO notify (message, time, subscriber_id) VALUES (%s, now(), %s)"
                       			 para1=message,sub_id
                        		 cur.execute(qry1,para1)
                       			 conn.commit()
                       			 flag2=1



def No_Permit(sub_id):
            print('Subscriber does not have permit here')
			message="Sorry! You dont have a permit here."
			qry1="INSERT INTO notify (message, time, subscriber_id) VALUES (%s, now(), %s)"
			para1=message,sub_id
			cur.execute(qry1,para1)
			conn.commit()
            


conn = pymysql.connect(host='192.168.8.102', port=3306, user='pi', passwd='pi@123', db='windowsup')
cur = conn.cursor()

while True:

	id = str(raw_input("Enter Id: "))

	cur.execute("SELECT rfid_no FROM subscriber_vehicles WHERE rfid_no=%s",id)

	if((cur.fetchone()[0]) == id):
		cur.execute("SELECT subscriber_id FROM subscriber_vehicles WHERE rfid_no=%s",id)
		sub_id=(cur.fetchone()[0])

		(cur.execute("SELECT permit_status FROM parking_permits WHERE subscriber_id=%s AND permit_status='Accepted'",sub_id))
		try:
			park_permit = (cur.fetchone()[0])
		except:
			park_permit="Denied"

		if(park_permit == "Accepted" ):
			print ("Valid Subscriber!")
			if(cur.execute("SELECT rfid_no FROM parked_vehicles WHERE rfid_no=%s",id)):
				(cur.execute("SELECT parking_status FROM parked_vehicles WHERE rfid_no=%s",id))
				park_stat = (cur.fetchone()[0])
				if(park_stat == "Parked"):
					Gate_Close(id)

	       		else:
                    flag1
                    flag2
                    t1 = threading.Thread(target=Check_Permits, args=(sub_id,))
                    t2 = threading.Thread(target=Check_Vacancy, args=(sub_id,))
                    
			        t1.start()
                    t2.start()
                    
                    t1.join() 
                    if(flag1==1):
                                 continue
                         
				    t2.join()
                    if(flag2==1):
                                 continue
                             
                                
       				Gate_Open(sub_id,id)
		else:
    		No_Permit(sub_id)
	else:
		print("Not a valid Subscriber")

cur.close()
conn.close()
