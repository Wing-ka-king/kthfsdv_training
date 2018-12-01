#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg import Int32

def talker():
    pub = rospy.Publisher('singh', Int32 , queue_size=10)
    rospy.init_node('nodeA')
    rate = rospy.Rate(0.05) # 0.05hz
    k = 0
    n = 4
    while not rospy.is_shutdown():
        rospy.loginfo(k)
        pub.publish(k)
        rate.sleep()
	k = k + n

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass

