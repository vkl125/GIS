import { useEffect, useRef } from "react";
import Map from "@arcgis/core/Map";
import MapView from "@arcgis/core/views/MapView";
import Search from "@arcgis/core/widgets/Search";
import "./GIS.css";
// import TileLayer from "esri/layers/TileLayer";
import TileLayer from "@arcgis/core/layers/TileLayer";
import MapImageLayer from "@arcgis/core/layers/MapImageLayer";
import FeatureLayer from "@arcgis/core/layers/FeatureLayer";
// import { vectorBasemapLayer } from "esri-leaflet-vector";

interface IProps {
  center: Array<number>;
  zoom: number;
}

export default function GIS({ center, zoom }: IProps) {
  const mapDiv = useRef(null);

  useEffect(() => {
    if (mapDiv.current) {
      // const map = new Map({ basemap: "topo" });

     
      // const basemap = new VectorTileLayer({
      //   url: "https://cens21cdmswebp1.dept.censtatd.hksarg/arcgis/rest/services/CASD/CASD_BUILDING/MapServer"
      // });
    
    
      const map = new Map({
        // basemap: basemap,
      });
    
      // const view = new MapView({
      //   container: "viewDiv",
      //   map: map,
      //   constraints: {
      //         snapToZoom: false
      //       }
      // });
      const view = new MapView({
        map,
        //center: [22.356514, 114.136253],
        zoom: 5,
        container: mapDiv.current,
      });

      // let layer = new TileLayer({
      //   url: "https://services.arcgisonline.com/arcgis/rest/services/World_Terrain_Base/MapServer"
      // });

      let layer = new MapImageLayer({
        url: "https://services.arcgisonline.com/arcgis/rest/services/World_Terrain_Base/MapServer"
      });
      map.add(layer); 
      
     // const searchWidget = new Search({ view });
     // view.ui.add(searchWidget, "top-right");
    }
  }, [center, zoom]);

  return <div id="gisDiv" ref={mapDiv}></div>;
}
