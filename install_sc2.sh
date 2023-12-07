#!/bin/bash
# Install SC2 and add the custom maps

mkdir 3rdparty
cd 3rdparty

export SC2PATH=`pwd`'/StarCraftII'
echo 'SC2PATH is set to '$SC2PATH

if [ ! -d $SC2PATH ]; then
        echo 'StarCraftII is not installed. Installing now ...';
        wget http://blzdistsc2-a.akamaihd.net/Linux/SC2.4.10.zip
        unzip -P iagreetotheeula SC2.4.10.zip
        rm -rf SC2.4.10.zip
else
        echo 'StarCraftII is already installed.'
fi

echo 'Adding SMAC maps.'
MAP_DIR="$SC2PATH/Maps/"
echo 'MAP_DIR is set to '$MAP_DIR

if [ ! -d $MAP_DIR ]; then
        mkdir -p $MAP_DIR
fi

cd ..
wget https://github.com/oxwhirl/smac/releases/download/v0.1-beta1/SMAC_Maps.zip
unzip SMAC_Maps.zip
mv SMAC_Maps $MAP_DIR
rm SMAC_Maps.zip

# download custom maps
wget https://github.com/ndhuynh02/smac/raw/master/smac/env/starcraft2/maps/SMAC_Maps/50m_vs_2c.SC2Map
wget https://github.com/ndhuynh02/smac/raw/master/smac/env/starcraft2/maps/SMAC_Maps/50s_vs_25sc.SC2Map
wget https://github.com/ndhuynh02/smac/raw/master/smac/env/starcraft2/maps/SMAC_Maps/54m_vs_60m.SC2Map
wget https://github.com/ndhuynh02/smac/raw/master/smac/env/starcraft2/maps/SMAC_Maps/60m_vs_2c.SC2Map
mv *.SC2Map $MAP_DIR/SMAC_Maps/

echo 'StarCraft II and SMAC are installed.'

