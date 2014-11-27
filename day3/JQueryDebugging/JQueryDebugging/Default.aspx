<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="JQueryDebugging._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to ASP.NET!
    </h2>
    <p>
        To learn more about ASP.NET visit <a href="http://www.asp.net" title="ASP.NET Website">www.asp.net</a>.
    </p>
    <p>
        You can also find <a href="http://go.microsoft.com/fwlink/?LinkID=152368&amp;clcid=0x409"
            title="MSDN ASP.NET Docs">documentation on ASP.NET at MSDN</a>.
    </p>
    <p class="log">Lo apparirà qui</p>

    <script>
        // Log substem
        // var $ = jQuery;
        //var target = $(".hentry"); /*.hentry funziona anche sul tema mobile di wordpress */
        var target = $(".log");
        // $(target).html("");
        var l = function (msg) {
            target.prepend(msg + "<br/>");
            // Write the load time to the F12 console.
            if (window.console) console.log(msg);
        }
        l("Ready...");

    </script>

    <script>
        // Geolocalization        
        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                l("Geolocation is not supported by this browser.");
            }
        }
        function showPosition(position) {
            l("Latitude: " + position.coords.latitude + "Longitude: " + position.coords.longitude);
        };
        l("Calling Get Location");
        getLocation();
        l("");
        l("Get Location called");
        //loadTime();
    </script>


    <!-- Web timing api supportata solo da IE9+ -->
    <script type="text/javascript">
        // GG See http://msdn.microsoft.com/en-us/library/ie/hh673552%28v=vs.85%29.aspx
        // Add load event listener.
        window.addEventListener("load", loadTime, false);

        function loadTime() {
            // Get current time.
            var now = new Date().getTime();
            // Calculate page load time.
            var page_load_time = now - performance.timing.navigationStart;
            l("Page load time:"+page_load_time);
        }
 </script>

</asp:Content>
