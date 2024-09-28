void  weighted_rr(int req[4], int weight[4], int grant[4], int reset)
{
	#pragma HLS INTERFACE m_axi port=req offset=slave
	#pragma HLS INTERFACE m_axi port=weight offset=slave
	#pragma HLS INTERFACE m_axi port=grant offset=slave

	//#pragma HLS interface mode=axis port=req,weight,grant

	#pragma HLS INTERFACE s_axilite port=reset
	#pragma HLS INTERFACE s_axilite port=return
	#pragma HLS DATAFLOW


    static int counters[4] = {0, 0, 0, 0};
    static int current = 0;
	#pragma HLS RESOURCE variable=counters core=RAM_1P_BRAM

    if(reset)
    {
        for(int i = 0; i < 4; i++) {
			#pragma HLS unroll factor=4
            grant[i] = 0;
            counters[i] = 0;
        }
        current = 0;
        return;
    }

    while (1) {
		#pragma HLS LOOP_TRIPCOUNT min=1 max=4

        if(req[current] == 1)
        {
            if(counters[current] < weight[current])
            {
                grant[current] = 1;
                counters[current]++;
                for(int j = 0; j < 4; j++)
                {
					#pragma HLS unroll factor=4
                    if(j != current)
                        grant[j] = 0;
                }

                return;
            }
            else
            {
                counters[current] = 0;
            }
        }
        current = (current + 1) % 4;
    }
}

