class teamboard_common {


        case $::operatingsystem {
        
			'RedHat', 'CentOs' : {

				anchor {"teamboard_common::begin":} ->
				class {"::teamboard_common::user":} ->
				anchor {"teamboard_common::end":}

			}

			'ubuntu', 'debian': {


				anchor {"teamboard_common::begin":} ->
				class {"::teamboard_common::packages":} ->
				class {"::teamboard_common::user":} ->
				class {"::teamboard_common::ulimits":} ->
				anchor {"teamboard_common::end":}


			}

			default: {

			}

		}

}

