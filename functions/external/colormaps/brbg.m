function cm_data = BrBG(m)

cm = [
        0.3294    0.1882    0.0196 ;
    0.3380    0.1933    0.0204 ;
    0.3466    0.1984    0.0211 ;
    0.3552    0.2035    0.0219 ;
    0.3639    0.2085    0.0227 ;
    0.3725    0.2136    0.0235 ;
    0.3811    0.2187    0.0242 ;
    0.3897    0.2238    0.0250 ;
    0.3983    0.2288    0.0258 ;
    0.4069    0.2339    0.0265 ;
    0.4155    0.2390    0.0273 ;
    0.4241    0.2441    0.0281 ;
    0.4328    0.2491    0.0288 ;
    0.4414    0.2542    0.0296 ;
    0.4500    0.2593    0.0304 ;
    0.4586    0.2644    0.0311 ;
    0.4672    0.2694    0.0319 ;
    0.4758    0.2745    0.0327 ;
    0.4844    0.2796    0.0334 ;
    0.4930    0.2847    0.0342 ;
    0.5017    0.2897    0.0350 ;
    0.5103    0.2948    0.0358 ;
    0.5189    0.2999    0.0365 ;
    0.5275    0.3050    0.0373 ;
    0.5361    0.3100    0.0381 ;
    0.5447    0.3151    0.0388 ;
    0.5529    0.3213    0.0419 ;
    0.5608    0.3287    0.0473 ;
    0.5686    0.3361    0.0527 ;
    0.5765    0.3435    0.0581 ;
    0.5843    0.3509    0.0634 ;
    0.5922    0.3582    0.0688 ;
    0.6000    0.3656    0.0742 ;
    0.6078    0.3730    0.0796 ;
    0.6157    0.3804    0.0850 ;
    0.6235    0.3878    0.0903 ;
    0.6314    0.3952    0.0957 ;
    0.6392    0.4025    0.1011 ;
    0.6471    0.4099    0.1065 ;
    0.6549    0.4173    0.1119 ;
    0.6627    0.4247    0.1173 ;
    0.6706    0.4321    0.1226 ;
    0.6784    0.4394    0.1280 ;
    0.6863    0.4468    0.1334 ;
    0.6941    0.4542    0.1388 ;
    0.7020    0.4616    0.1442 ;
    0.7098    0.4690    0.1496 ;
    0.7176    0.4764    0.1549 ;
    0.7255    0.4837    0.1603 ;
    0.7333    0.4911    0.1657 ;
    0.7412    0.4985    0.1711 ;
    0.7490    0.5059    0.1765 ;
    0.7539    0.5159    0.1888 ;
    0.7589    0.5259    0.2011 ;
    0.7638    0.5359    0.2134 ;
    0.7687    0.5459    0.2257 ;
    0.7736    0.5559    0.2380 ;
    0.7785    0.5659    0.2503 ;
    0.7835    0.5759    0.2626 ;
    0.7884    0.5859    0.2749 ;
    0.7933    0.5958    0.2872 ;
    0.7982    0.6058    0.2995 ;
    0.8032    0.6158    0.3118 ;
    0.8081    0.6258    0.3241 ;
    0.8130    0.6358    0.3364 ;
    0.8179    0.6458    0.3487 ;
    0.8228    0.6558    0.3610 ;
    0.8278    0.6658    0.3733 ;
    0.8327    0.6758    0.3856 ;
    0.8376    0.6858    0.3979 ;
    0.8425    0.6958    0.4102 ;
    0.8474    0.7058    0.4225 ;
    0.8524    0.7158    0.4348 ;
    0.8573    0.7258    0.4471 ;
    0.8622    0.7358    0.4594 ;
    0.8671    0.7458    0.4717 ;
    0.8720    0.7558    0.4840 ;
    0.8763    0.7637    0.4956 ;
    0.8798    0.7696    0.5063 ;
    0.8834    0.7754    0.5171 ;
    0.8869    0.7812    0.5279 ;
    0.8904    0.7871    0.5386 ;
    0.8940    0.7929    0.5494 ;
    0.8975    0.7988    0.5602 ;
    0.9010    0.8046    0.5709 ;
    0.9046    0.8105    0.5817 ;
    0.9081    0.8163    0.5925 ;
    0.9116    0.8221    0.6032 ;
    0.9152    0.8280    0.6140 ;
    0.9187    0.8338    0.6248 ;
    0.9223    0.8397    0.6355 ;
    0.9258    0.8455    0.6463 ;
    0.9293    0.8514    0.6571 ;
    0.9329    0.8572    0.6678 ;
    0.9364    0.8631    0.6786 ;
    0.9399    0.8689    0.6894 ;
    0.9435    0.8747    0.7001 ;
    0.9470    0.8806    0.7109 ;
    0.9506    0.8864    0.7216 ;
    0.9541    0.8923    0.7324 ;
    0.9576    0.8981    0.7432 ;
    0.9612    0.9040    0.7539 ;
    0.9647    0.9098    0.7647 ;
    0.9646    0.9118    0.7724 ;
    0.9644    0.9138    0.7801 ;
    0.9642    0.9158    0.7878 ;
    0.9641    0.9178    0.7955 ;
    0.9639    0.9198    0.8032 ;
    0.9638    0.9218    0.8108 ;
    0.9636    0.9238    0.8185 ;
    0.9635    0.9258    0.8262 ;
    0.9633    0.9278    0.8339 ;
    0.9632    0.9298    0.8416 ;
    0.9630    0.9318    0.8493 ;
    0.9629    0.9338    0.8570 ;
    0.9627    0.9358    0.8647 ;
    0.9626    0.9378    0.8724 ;
    0.9624    0.9398    0.8800 ;
    0.9622    0.9418    0.8877 ;
    0.9621    0.9438    0.8954 ;
    0.9619    0.9458    0.9031 ;
    0.9618    0.9478    0.9108 ;
    0.9616    0.9498    0.9185 ;
    0.9615    0.9518    0.9262 ;
    0.9613    0.9538    0.9339 ;
    0.9612    0.9558    0.9416 ;
    0.9610    0.9578    0.9493 ;
    0.9609    0.9598    0.9569 ;
    0.9572    0.9599    0.9596 ;
    0.9502    0.9582    0.9571 ;
    0.9431    0.9566    0.9546 ;
    0.9360    0.9549    0.9522 ;
    0.9290    0.9532    0.9497 ;
    0.9219    0.9515    0.9473 ;
    0.9148    0.9498    0.9448 ;
    0.9077    0.9481    0.9423 ;
    0.9007    0.9464    0.9399 ;
    0.8936    0.9447    0.9374 ;
    0.8865    0.9430    0.9349 ;
    0.8794    0.9413    0.9325 ;
    0.8724    0.9396    0.9300 ;
    0.8653    0.9379    0.9276 ;
    0.8582    0.9363    0.9251 ;
    0.8511    0.9346    0.9226 ;
    0.8441    0.9329    0.9202 ;
    0.8370    0.9312    0.9177 ;
    0.8299    0.9295    0.9153 ;
    0.8228    0.9278    0.9128 ;
    0.8158    0.9261    0.9103 ;
    0.8087    0.9244    0.9079 ;
    0.8016    0.9227    0.9054 ;
    0.7945    0.9210    0.9030 ;
    0.7875    0.9193    0.9005 ;
    0.7804    0.9176    0.8980 ;
    0.7695    0.9132    0.8925 ;
    0.7586    0.9087    0.8870 ;
    0.7476    0.9043    0.8814 ;
    0.7367    0.8998    0.8759 ;
    0.7258    0.8953    0.8704 ;
    0.7149    0.8909    0.8648 ;
    0.7040    0.8864    0.8593 ;
    0.6930    0.8820    0.8537 ;
    0.6821    0.8775    0.8482 ;
    0.6712    0.8730    0.8427 ;
    0.6603    0.8686    0.8371 ;
    0.6494    0.8641    0.8316 ;
    0.6384    0.8597    0.8261 ;
    0.6275    0.8552    0.8205 ;
    0.6166    0.8507    0.8150 ;
    0.6057    0.8463    0.8095 ;
    0.5948    0.8418    0.8039 ;
    0.5839    0.8374    0.7984 ;
    0.5729    0.8329    0.7928 ;
    0.5620    0.8285    0.7873 ;
    0.5511    0.8240    0.7818 ;
    0.5402    0.8195    0.7762 ;
    0.5293    0.8151    0.7707 ;
    0.5183    0.8106    0.7652 ;
    0.5074    0.8062    0.7596 ;
    0.4962    0.7998    0.7530 ;
    0.4847    0.7915    0.7453 ;
    0.4731    0.7832    0.7376 ;
    0.4616    0.7749    0.7300 ;
    0.4501    0.7666    0.7223 ;
    0.4385    0.7582    0.7146 ;
    0.4270    0.7499    0.7069 ;
    0.4155    0.7416    0.6992 ;
    0.4039    0.7333    0.6915 ;
    0.3924    0.7250    0.6838 ;
    0.3809    0.7167    0.6761 ;
    0.3693    0.7084    0.6684 ;
    0.3578    0.7001    0.6607 ;
    0.3463    0.6918    0.6531 ;
    0.3347    0.6835    0.6454 ;
    0.3232    0.6752    0.6377 ;
    0.3116    0.6669    0.6300 ;
    0.3001    0.6586    0.6223 ;
    0.2886    0.6503    0.6146 ;
    0.2770    0.6420    0.6069 ;
    0.2655    0.6337    0.5992 ;
    0.2540    0.6254    0.5915 ;
    0.2424    0.6171    0.5839 ;
    0.2309    0.6088    0.5762 ;
    0.2194    0.6005    0.5685 ;
    0.2078    0.5922    0.5608 ;
    0.1998    0.5846    0.5532 ;
    0.1918    0.5771    0.5457 ;
    0.1839    0.5696    0.5382 ;
    0.1759    0.5620    0.5306 ;
    0.1679    0.5545    0.5231 ;
    0.1599    0.5469    0.5156 ;
    0.1519    0.5394    0.5080 ;
    0.1439    0.5319    0.5005 ;
    0.1359    0.5243    0.4930 ;
    0.1279    0.5168    0.4854 ;
    0.1199    0.5093    0.4779 ;
    0.1119    0.5017    0.4704 ;
    0.1039    0.4942    0.4628 ;
    0.0959    0.4867    0.4553 ;
    0.0879    0.4791    0.4478 ;
    0.0799    0.4716    0.4402 ;
    0.0719    0.4641    0.4327 ;
    0.0639    0.4565    0.4251 ;
    0.0559    0.4490    0.4176 ;
    0.0479    0.4414    0.4101 ;
    0.0399    0.4339    0.4025 ;
    0.0319    0.4264    0.3950 ;
    0.0239    0.4188    0.3875 ;
    0.0159    0.4113    0.3799 ;
    0.0079    0.4038    0.3724 ;
    0.0038    0.3968    0.3651 ;
    0.0037    0.3903    0.3580 ;
    0.0035    0.3839    0.3509 ;
    0.0034    0.3774    0.3439 ;
    0.0032    0.3709    0.3368 ;
    0.0031    0.3645    0.3297 ;
    0.0029    0.3580    0.3226 ;
    0.0028    0.3516    0.3156 ;
    0.0026    0.3451    0.3085 ;
    0.0025    0.3386    0.3014 ;
    0.0023    0.3322    0.2943 ;
    0.0022    0.3257    0.2873 ;
    0.0020    0.3193    0.2802 ;
    0.0018    0.3128    0.2731 ;
    0.0017    0.3063    0.2661 ;
    0.0015    0.2999    0.2590 ;
    0.0014    0.2934    0.2519 ;
    0.0012    0.2870    0.2448 ;
    0.0011    0.2805    0.2378 ;
    0.0009    0.2740    0.2307 ;
    0.0008    0.2676    0.2236 ;
    0.0006    0.2611    0.2165 ;
    0.0005    0.2547    0.2095 ;
    0.0003    0.2482    0.2024 ;
    0.0002    0.2418    0.1953 ;
         0    0.2353    0.1882 ;
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