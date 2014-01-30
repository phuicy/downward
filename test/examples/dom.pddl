(define (domain test ) 
	(:requirements :strips :equality :typing :action-costs) 
	(:types sub pub topic attrib type) 
	(:constants 
		rate1-preStateSub resize-preState record-preState rate2-preStateSub  - sub  
		rate1-effState resize-effState example_state_pub record-effState example_state_pub1 rate2-effState  - pub 
		sixForty_EA_map_imageWidth fourEighty_EA_map_imageHeight three_EA_map_frameRate five_EA_map_frameRate ten_EA_map_frameRate sevenTwenty_EA_map_imageHeight twelveEighty_EA_map_imageWidth   - attrib 
		EMs_visual  - type 
		rate1_topic resizeTopic gscam_image_raw record image_raw1 rate2_topic  - topic  
	)
 	(:predicates 
		(topicIsPublishing ?t - topic ) 
		(isSubscribing ?s - sub) 
		(isPublishing ?p - pub ) 
		(pubToTopic ?p - pub ?t - topic) 
		(subToTopic ?s - sub ?t - topic) 
		(topicToPub ?t - topic ?p - pub) 
		(topicToSub ?t - topic ?s - sub) 
		(pubHasAttrib ?p - pub ?a - attrib) 
		(subHasAttrib ?s - sub ?a - attrib) 
		(subType ?s - sub ?ty - type) 
		(pubType ?p - pub ?ty - type) 
		(topicType ?t - topic ?ty - type) 
	)

	(:functions	(total-cost)) 
	(:action   rate1		
		:parameters  (?p - pub) 		 
		:precondition  
			( and (isSubscribing rate1-preStateSub ) ( subHasAttrib rate1-preStateSub five_EA_map_frameRate ) ( subHasAttrib rate1-preStateSub sixForty_EA_map_imageWidth ) ( subHasAttrib rate1-preStateSub fourEighty_EA_map_imageHeight ) (subType rate1-preStateSub EMs_visual)  ) 
		:effect   
			 ( and( and (pubToTopic rate1-effState rate1_topic) (topicToPub rate1_topic rate1-effState) (topicIsPublishing rate1_topic ) (pubType rate1-effState EMs_visual ) (topicType rate1_topic EMs_visual ) (isPublishing rate1-effState) ( pubHasAttrib rate1-effState sixForty_EA_map_imageWidth ) ( pubHasAttrib rate1-effState fourEighty_EA_map_imageHeight ) ( pubHasAttrib rate1-effState three_EA_map_frameRate )  ) ( increase (total-cost) 12  )  )  
 	) 
	(:action   resize		
		:parameters  (?p - pub) 		 
		:precondition  
			( and (isSubscribing resize-preState ) ( subHasAttrib resize-preState sevenTwenty_EA_map_imageHeight ) ( subHasAttrib resize-preState twelveEighty_EA_map_imageWidth ) ( subHasAttrib resize-preState three_EA_map_frameRate ) (subType resize-preState EMs_visual)  ) 
		:effect   
			 ( and( and (pubToTopic resize-effState resizeTopic) (topicToPub resizeTopic resize-effState) (topicIsPublishing resizeTopic ) (pubType resize-effState EMs_visual ) (topicType resizeTopic EMs_visual ) (isPublishing resize-effState) ( pubHasAttrib resize-effState three_EA_map_frameRate ) ( pubHasAttrib resize-effState fourEighty_EA_map_imageHeight ) ( pubHasAttrib resize-effState sixForty_EA_map_imageWidth ) ( pubHasAttrib resize-effState ten_EA_map_frameRate )  ) ( increase (total-cost) 10  )  )  
 	) 
	(:action   webcam1		
		:parameters  (?p - pub) 		 
		:effect   
			 ( and( increase (total-cost) 10  ) ( and (pubToTopic example_state_pub gscam_image_raw) (topicToPub gscam_image_raw example_state_pub) (topicIsPublishing gscam_image_raw ) (pubType example_state_pub EMs_visual ) (topicType gscam_image_raw EMs_visual ) (isPublishing example_state_pub) ( pubHasAttrib example_state_pub fourEighty_EA_map_imageHeight ) ( pubHasAttrib example_state_pub sixForty_EA_map_imageWidth ) ( pubHasAttrib example_state_pub ten_EA_map_frameRate )  )  )  
 	) 
	(:action   record		
		:parameters  (?p - pub) 		 
		:precondition  
			( and (isSubscribing record-preState ) ( subHasAttrib record-preState fourEighty_EA_map_imageHeight ) ( subHasAttrib record-preState sixForty_EA_map_imageWidth ) ( subHasAttrib record-preState three_EA_map_frameRate ) (subType record-preState EMs_visual)  ) 
		:effect   
			( and (pubToTopic record-effState record) (topicToPub record record-effState) (topicIsPublishing record ) (pubType record-effState EMs_visual ) (topicType record EMs_visual ) (isPublishing record-effState) ( pubHasAttrib record-effState fourEighty_EA_map_imageHeight ) ( pubHasAttrib record-effState sixForty_EA_map_imageWidth ) ( pubHasAttrib record-effState three_EA_map_frameRate )  ) 
 	) 
	(:action   webcam2		
		:parameters  (?p - pub) 		 
		:effect   
			 ( and( and (pubToTopic example_state_pub1 image_raw1) (topicToPub image_raw1 example_state_pub1) (topicIsPublishing image_raw1 ) (pubType example_state_pub1 EMs_visual ) (topicType image_raw1 EMs_visual ) (isPublishing example_state_pub1) ( pubHasAttrib example_state_pub1 sevenTwenty_EA_map_imageHeight ) ( pubHasAttrib example_state_pub1 twelveEighty_EA_map_imageWidth ) ( pubHasAttrib example_state_pub1 five_EA_map_frameRate )  ) ( increase (total-cost) 30  )  )  
 	) 
	(:action   rate2		
		:parameters  (?p - pub) 		 
		:precondition  
			( and (isSubscribing rate2-preStateSub ) ( subHasAttrib rate2-preStateSub ten_EA_map_frameRate ) ( subHasAttrib rate2-preStateSub sixForty_EA_map_imageWidth ) ( subHasAttrib rate2-preStateSub fourEighty_EA_map_imageHeight ) (subType rate2-preStateSub EMs_visual)  ) 
		:effect   
			 ( and( and (pubToTopic rate2-effState rate2_topic) (topicToPub rate2_topic rate2-effState) (topicIsPublishing rate2_topic ) (pubType rate2-effState EMs_visual ) (topicType rate2_topic EMs_visual ) (isPublishing rate2-effState) ( pubHasAttrib rate2-effState sixForty_EA_map_imageWidth ) ( pubHasAttrib rate2-effState fourEighty_EA_map_imageHeight ) ( pubHasAttrib rate2-effState three_EA_map_frameRate )  ) ( increase (total-cost) 13  )  )  
 	) 

	(:action subscribe 
		:parameters (?s - sub ?t - topic ?p - pub ?a1 ?a2 ?a3 - attrib ?ty - type ) 
		:precondition 
			(and     
				(topicIsPublishing ?t) 
				(not( subToTopic ?s ?t)) 
				(pubHasAttrib ?p ?a1) 
				(pubHasAttrib ?p ?a2) 
				(pubHasAttrib ?p ?a3) 
				(pubToTopic ?p ?t) 
				(pubType ?p ?ty) 
				(topicType ?t ?ty) 
				(not ( = ?a1 ?a2)) 
				(not ( = ?a1 ?a3)) 
				(not ( = ?a2 ?a3)) 
			) 
		:effect 
			(and  
				(subToTopic ?s ?t) 
				(topicToSub ?t ?s) 
				(isSubscribing ?s) 
				(subHasAttrib ?s ?a1) 
				(subHasAttrib ?s ?a2) 
				(subHasAttrib ?s ?a3) 
				(subType ?s ?ty) 
			) 
	)  

 )
