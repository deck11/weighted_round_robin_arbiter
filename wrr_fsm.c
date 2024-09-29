void weighted_rr(int req[4], int weight[4], int grant[4], int reset)
{
	#pragma HLS INTERFACE m_axi port=req offset=slave
	#pragma HLS INTERFACE m_axi port=weight offset=slave
	#pragma HLS INTERFACE m_axi port=grant offset=slave
	#pragma HLS INTERFACE s_axilite port=reset
	#pragma HLS INTERFACE s_axilite port=return
	#pragma HLS DATAFLOW

	static int counters[4] = {0, 0, 0, 0};
	static int state = 0;
	#pragma HLS RESOURCE variable=counters core=RAM_1P_BRAM

	enum fsm_states { RESET_STATE, GRANT_0, GRANT_1, GRANT_2, GRANT_3 };
	static enum fsm_states fsm_state = RESET_STATE;  

	switch (fsm_state)
	{
  	case RESET_STATE: 
  		for (int i = 0; i < 4; i++) {
  			#pragma HLS unroll factor=4
  			grant[i] = 0;
  			counters[i] = 0;
  		}
  		state = 0;
  		if (!reset) {
  			fsm_state = GRANT_0;
  		}
  		break;

  	case GRANT_0: 
  		if (req[0] == 1 && counters[0] < weight[0])
  		{
  			grant[0] = 1;
  			counters[0]++;
  			grant[1] = grant[2] = grant[3] = 0;
  		}
  		if (counters[0] == weight[0]) 
  		{
  			counters[0] = 0;
  			fsm_state = GRANT_1;
  		}
  		break;
  
  	case GRANT_1: 
  		if (req[1] == 1 && counters[1] < weight[1])
  		{
  			grant[1] = 1;
  			counters[1]++;
  			grant[0] = grant[2] = grant[3] = 0;
  		}
  		if (counters[1] == weight[1])
  		{
  			counters[1] = 0;
  			fsm_state = GRANT_3; 
  		}
  		break;
  
  	case GRANT_3: 
  		if (req[3] == 1 && counters[3] < weight[3])
  		{
  			grant[3] = 1;
  			counters[3]++;
  			grant[0] = grant[1] = grant[2] = 0;
  		}
  		if (counters[3] == weight[3])
  		{
  			counters[3] = 0;
  			fsm_state = GRANT_0; 
  		}
  		break;
	}
}
