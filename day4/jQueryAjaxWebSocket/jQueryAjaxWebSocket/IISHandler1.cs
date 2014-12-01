using System;
using System.Net.WebSockets;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.WebSockets;

namespace jQueryAjaxWebSocket
{
    public class IISHandler1 : IHttpHandler
    {
        /// <summary>
        /// You will need to configure this handler in the Web.config file of your 
        /// web and register it with IIS before being able to use it. For more information
        /// see the following link: http://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpHandler Members

        public bool IsReusable
        {
            // Return false in case your Managed Handler cannot be reused for another request.
            // Usually this would be false in case you have some state information preserved per request.
            get { return true; }
        }

        public void ProcessRequest(HttpContext context)
        {
            //write your handler implementation here.
            // GG su IIS <8.0 non sembra funzionare
            if (context.IsWebSocketRequest)
            {
                // We got it
                context.AcceptWebSocketRequest(PushExampleData);
            }
        }


        public async Task PushExampleData(AspNetWebSocketContext context)
        {
            WebSocket socket = context.WebSocket;
            while (true)
            {
                ArraySegment<byte> buffer = new ArraySegment<byte>(new byte[1024]);
                WebSocketReceiveResult result = await socket.ReceiveAsync(buffer, CancellationToken.None);
                if (socket.State == WebSocketState.Open)
                {

                }
                else
                {
                    break;
                }
                /*
                 * 
                ArraySegment buffer = new ArraySegment(new byte[1024]);
                WebSocketReceiveResult result = await socket.ReceiveAsync(buffer, CancellationToken.None);
                if (socket.State == WebSocketState.Open)
                {
                    string userMessage = Encoding.UTF8.GetString(buffer.Array, 0, result.Count);
                    userMessage = "You sent: " + userMessage + " at " + DateTime.Now.ToLongTimeString();
                    buffer = new ArraySegment(Encoding.UTF8.GetBytes(userMessage));
                    await socket.SendAsync(buffer, WebSocketMessageType.Text, true, CancellationToken.None);
                }
                else
                {
                    break;
                }*/
            }
        }

        #endregion
    }
}
