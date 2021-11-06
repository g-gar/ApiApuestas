using System.Diagnostics;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;

namespace rest.delegationhandler {
    public class LogRequestAndResponseHandler : DelegatingHandler{

        private readonly ILogger logger;

        public LogRequestAndResponseHandler(ILogger logger)
        {
            this.logger = logger;
        }

        protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
        {
            if (request.Content != null)
            {
                // log request body
                string requestBody = await request.Content.ReadAsStringAsync();
                logger.LogInformation(requestBody);
            }
            // let other handlers process the request
            HttpResponseMessage result = await base.SendAsync(request, cancellationToken);

            if (result.Content != null)
            {
                // once response body is ready, log it
                string responseBody = await result.Content.ReadAsStringAsync();
                logger.LogInformation(responseBody);
            }

            return result;
        }
    }
}