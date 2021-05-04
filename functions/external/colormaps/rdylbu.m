function cm_data = RdYlBu(m)


cm = [
        0.6471         0    0.1490;
    0.6547    0.0074    0.1492;
    0.6624    0.0148    0.1493;
    0.6701    0.0221    0.1495;
    0.6778    0.0295    0.1496;
    0.6855    0.0369    0.1498;
    0.6932    0.0443    0.1499;
    0.7009    0.0517    0.1501;
    0.7086    0.0591    0.1502;
    0.7163    0.0664    0.1504;
    0.7240    0.0738    0.1506;
    0.7316    0.0812    0.1507;
    0.7393    0.0886    0.1509;
    0.7470    0.0960    0.1510;
    0.7547    0.1033    0.1512;
    0.7624    0.1107    0.1513;
    0.7701    0.1181    0.1515;
    0.7778    0.1255    0.1516;
    0.7855    0.1329    0.1518;
    0.7932    0.1403    0.1519;
    0.8008    0.1476    0.1521;
    0.8085    0.1550    0.1522;
    0.8162    0.1624    0.1524;
    0.8239    0.1698    0.1526;
    0.8316    0.1772    0.1527;
    0.8393    0.1845    0.1529;
    0.8454    0.1929    0.1551;
    0.8498    0.2023    0.1594;
    0.8543    0.2117    0.1637;
    0.8587    0.2211    0.1680;
    0.8632    0.2304    0.1723;
    0.8677    0.2398    0.1766;
    0.8721    0.2492    0.1809;
    0.8766    0.2586    0.1852;
    0.8810    0.2680    0.1895;
    0.8855    0.2774    0.1938;
    0.8900    0.2867    0.1982;
    0.8944    0.2961    0.2025;
    0.8989    0.3055    0.2068;
    0.9033    0.3149    0.2111;
    0.9078    0.3243    0.2154;
    0.9123    0.3336    0.2197;
    0.9167    0.3430    0.2240;
    0.9212    0.3524    0.2283;
    0.9256    0.3618    0.2326;
    0.9301    0.3712    0.2369;
    0.9346    0.3805    0.2412;
    0.9390    0.3899    0.2455;
    0.9435    0.3993    0.2498;
    0.9479    0.4087    0.2541;
    0.9524    0.4181    0.2584;
    0.9569    0.4275    0.2627;
    0.9582    0.4374    0.2674;
    0.9596    0.4474    0.2720;
    0.9610    0.4574    0.2766;
    0.9624    0.4674    0.2812;
    0.9638    0.4774    0.2858;
    0.9652    0.4874    0.2904;
    0.9666    0.4974    0.2950;
    0.9679    0.5074    0.2997;
    0.9693    0.5174    0.3043;
    0.9707    0.5274    0.3089;
    0.9721    0.5374    0.3135;
    0.9735    0.5474    0.3181;
    0.9749    0.5574    0.3227;
    0.9762    0.5674    0.3273;
    0.9776    0.5774    0.3319;
    0.9790    0.5874    0.3366;
    0.9804    0.5974    0.3412;
    0.9818    0.6074    0.3458;
    0.9832    0.6174    0.3504;
    0.9845    0.6274    0.3550;
    0.9859    0.6374    0.3596;
    0.9873    0.6474    0.3642;
    0.9887    0.6574    0.3689;
    0.9901    0.6674    0.3735;
    0.9915    0.6774    0.3781;
    0.9922    0.6862    0.3840;
    0.9924    0.6939    0.3912;
    0.9925    0.7016    0.3985;
    0.9927    0.7093    0.4057;
    0.9928    0.7170    0.4129;
    0.9930    0.7246    0.4201;
    0.9932    0.7323    0.4274;
    0.9933    0.7400    0.4346;
    0.9935    0.7477    0.4418;
    0.9936    0.7554    0.4491;
    0.9938    0.7631    0.4563;
    0.9939    0.7708    0.4635;
    0.9941    0.7785    0.4707;
    0.9942    0.7862    0.4780;
    0.9944    0.7938    0.4852;
    0.9945    0.8015    0.4924;
    0.9947    0.8092    0.4997;
    0.9948    0.8169    0.5069;
    0.9950    0.8246    0.5141;
    0.9952    0.8323    0.5213;
    0.9953    0.8400    0.5286;
    0.9955    0.8477    0.5358;
    0.9956    0.8554    0.5430;
    0.9958    0.8631    0.5502;
    0.9959    0.8707    0.5575;
    0.9961    0.8784    0.5647;
    0.9962    0.8832    0.5719;
    0.9964    0.8880    0.5792;
    0.9965    0.8927    0.5864;
    0.9967    0.8975    0.5936;
    0.9968    0.9023    0.6008;
    0.9970    0.9070    0.6081;
    0.9972    0.9118    0.6153;
    0.9973    0.9166    0.6225;
    0.9975    0.9213    0.6298;
    0.9976    0.9261    0.6370;
    0.9978    0.9309    0.6442;
    0.9979    0.9356    0.6514;
    0.9981    0.9404    0.6587;
    0.9982    0.9452    0.6659;
    0.9984    0.9499    0.6731;
    0.9985    0.9547    0.6804;
    0.9987    0.9595    0.6876;
    0.9988    0.9642    0.6948;
    0.9990    0.9690    0.7020;
    0.9992    0.9738    0.7093;
    0.9993    0.9785    0.7165;
    0.9995    0.9833    0.7237;
    0.9996    0.9881    0.7309;
    0.9998    0.9928    0.7382;
    0.9999    0.9976    0.7454;
    0.9976    0.9991    0.7534;
    0.9928    0.9972    0.7622;
    0.9881    0.9954    0.7709;
    0.9833    0.9935    0.7797;
    0.9785    0.9917    0.7885;
    0.9738    0.9899    0.7972;
    0.9690    0.9880    0.8060;
    0.9642    0.9862    0.8148;
    0.9595    0.9843    0.8235;
    0.9547    0.9825    0.8323;
    0.9499    0.9806    0.8411;
    0.9452    0.9788    0.8498;
    0.9404    0.9769    0.8586;
    0.9356    0.9751    0.8674;
    0.9309    0.9732    0.8761;
    0.9261    0.9714    0.8849;
    0.9213    0.9696    0.8937;
    0.9166    0.9677    0.9024;
    0.9118    0.9659    0.9112;
    0.9070    0.9640    0.9200;
    0.9023    0.9622    0.9287;
    0.8975    0.9603    0.9375;
    0.8927    0.9585    0.9463;
    0.8880    0.9566    0.9550;
    0.8832    0.9548    0.9638;
    0.8784    0.9529    0.9725;
    0.8703    0.9489    0.9702;
    0.8621    0.9449    0.9679;
    0.8540    0.9409    0.9656;
    0.8458    0.9369    0.9633;
    0.8377    0.9329    0.9610;
    0.8295    0.9290    0.9587;
    0.8214    0.9250    0.9564;
    0.8132    0.9210    0.9541;
    0.8051    0.9170    0.9518;
    0.7969    0.9130    0.9495;
    0.7888    0.9090    0.9472;
    0.7806    0.9050    0.9449;
    0.7725    0.9010    0.9426;
    0.7643    0.8970    0.9403;
    0.7562    0.8930    0.9379;
    0.7480    0.8890    0.9356;
    0.7399    0.8850    0.9333;
    0.7317    0.8810    0.9310;
    0.7236    0.8770    0.9287;
    0.7154    0.8730    0.9264;
    0.7073    0.8690    0.9241;
    0.6991    0.8650    0.9218;
    0.6910    0.8610    0.9195;
    0.6828    0.8570    0.9172;
    0.6747    0.8530    0.9149;
    0.6664    0.8476    0.9119;
    0.6579    0.8408    0.9082;
    0.6494    0.8341    0.9045;
    0.6410    0.8273    0.9008;
    0.6325    0.8205    0.8971;
    0.6241    0.8138    0.8934;
    0.6156    0.8070    0.8897;
    0.6072    0.8002    0.8860;
    0.5987    0.7935    0.8824;
    0.5902    0.7867    0.8787;
    0.5818    0.7799    0.8750;
    0.5733    0.7732    0.8713;
    0.5649    0.7664    0.8676;
    0.5564    0.7596    0.8639;
    0.5479    0.7529    0.8602;
    0.5395    0.7461    0.8565;
    0.5310    0.7393    0.8528;
    0.5226    0.7326    0.8491;
    0.5141    0.7258    0.8454;
    0.5057    0.7190    0.8418;
    0.4972    0.7123    0.8381;
    0.4887    0.7055    0.8344;
    0.4803    0.6987    0.8307;
    0.4718    0.6920    0.8270;
    0.4634    0.6852    0.8233;
    0.4549    0.6784    0.8196;
    0.4477    0.6698    0.8151;
    0.4404    0.6612    0.8107;
    0.4332    0.6526    0.8062;
    0.4260    0.6440    0.8018;
    0.4188    0.6354    0.7973;
    0.4115    0.6268    0.7928;
    0.4043    0.6181    0.7884;
    0.3971    0.6095    0.7839;
    0.3899    0.6009    0.7795;
    0.3826    0.5923    0.7750;
    0.3754    0.5837    0.7705;
    0.3682    0.5751    0.7661;
    0.3609    0.5665    0.7616;
    0.3537    0.5579    0.7572;
    0.3465    0.5493    0.7527;
    0.3393    0.5406    0.7483;
    0.3320    0.5320    0.7438;
    0.3248    0.5234    0.7393;
    0.3176    0.5148    0.7349;
    0.3103    0.5062    0.7304;
    0.3031    0.4976    0.7260;
    0.2959    0.4890    0.7215;
    0.2887    0.4804    0.7170;
    0.2814    0.4717    0.7126;
    0.2742    0.4631    0.7081;
    0.2691    0.4540    0.7035;
    0.2660    0.4443    0.6987;
    0.2629    0.4346    0.6940;
    0.2598    0.4249    0.6892;
    0.2567    0.4152    0.6844;
    0.2537    0.4055    0.6797;
    0.2506    0.3958    0.6749;
    0.2475    0.3862    0.6701;
    0.2444    0.3765    0.6654;
    0.2414    0.3668    0.6606;
    0.2383    0.3571    0.6558;
    0.2352    0.3474    0.6511;
    0.2321    0.3377    0.6463;
    0.2291    0.3280    0.6415;
    0.2260    0.3183    0.6368;
    0.2229    0.3087    0.6320;
    0.2198    0.2990    0.6272;
    0.2168    0.2893    0.6225;
    0.2137    0.2796    0.6177;
    0.2106    0.2699    0.6129;
    0.2075    0.2602    0.6082;
    0.2045    0.2505    0.6034;
    0.2014    0.2408    0.5986;
    0.1983    0.2311    0.5938;
    0.1952    0.2215    0.5891;
    0.1922    0.2118    0.5843;
];

cm = flip(cm);


if nargin < 1
    cm_data = cm;
else
    hsv=rgb2hsv(cm);
    cm_data=interp1(linspace(0,1,size(cm,1)),hsv,linspace(0,1,m));
    cm_data=hsv2rgb(cm_data);
    
end
end