﻿using System.Web.Mvc;
using System.Web.Routing;

namespace StudMap.Admin.App_Start
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "AdminViewFloorplan",
                url: "{controller}/{action}/{mapId}/{floorId}",
                defaults: new { controller = "Admin", action = "GetFloorplanImage", mapId = UrlParameter.Optional, floorId = UrlParameter.Optional }
            );
        }
    }
}