#!/bin/bash
##
##
echo "#########################################"
echo "##    Select option:                   ##"
echo "##        1) Enter new server.         ##" 
echo "##        2) Remove server.            ##"            
echo "##        0) Exit.                     ##" 
echo "##    Monitoring Script version: 1.0   ##"
echo "#########################################"
read option
##
if [ $option -eq 1 ]; then
echo "Enter host address..."
read address
echo "enter name of server"
read name
echo "generating html"
##
sudo head -n -1 test.html > temp.html ; mv temp.html test.html
##
cat <<EOF >>  test.html
        <div class="row">   
                <div data-netdata="system.cpu" data-host="$address" data-gauge-max-value="100" data-chart-library="gauge" data-width="50%" data-after="-540" data-points="540" data-title="CPU" data-units="%" data-colors="#FF9331" class="netdata-container" style="width: 200px; height: 140px;"></div>
            </div>
                    <h2>$name</h2>
            <div class="row">
                <div class="col-xs-12"><p class="text-center"><a href="$address" class="btn btn-primary">Click Me!</a></p></div>
            </div>
    </head>
</html>
EOF
echo "Done."
fi 
##
if [ $option -eq 2 ]; then
echo "enter server name"
read server
awk '/'$server'/{for(x=NR-3;x<=NR+4;x++)d[x];}{a[NR]=$0}END{for(i=1;i<=NR;i++)if(!(i in d))print a[i]}' test.html | cat > test1.html
sudo rm test.html
sudo mv test1.html test.html
echo "Done."
fi 
##
if [ $option -eq 0 ]; then
echo "Exited without any changes."
echo "Done. "
fi
