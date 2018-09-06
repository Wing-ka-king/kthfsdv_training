#!/usr/bin/env python
import rospy
from std_msgs.msg import Int32
from std_msgs.msg import Float64

result = Float64()    

def callback(data):
    global result
    result = data.data/15.0
    
def listener():

    rospy.init_node('nodeB')
    rate = rospy.Rate(0.05) #0.05Hz

    while not rospy.is_shutdown() :
        rospy.Subscriber("singh", Int32, callback)
        result_pub = rospy.Publisher("/kthfs/result", Float64, queue_size=10)
	rospy.loginfo(rospy.get_caller_id() + "I heard %s", result)
	result_pub.publish(result)
        rate.sleep()

if __name__ == '__main__':
    listener()
