import tink.http.Request;
import tink.http.Response;
import tink.http.Container;
import tink.http.containers.*;

using tink.CoreApi;

class Server {
	#if (platform == "aws")
	@:expose('index') @:keep
	static function index(event, ctx, cb) {
		ctx.callbackWaitsForEmptyEventLoop = false;
		run(new AwsLambdaNodeContainer(event, ctx, cb));
	}
	
	#else
	static function main() {
		var port = switch Sys.getEnv('PORT') {
			case null: 8080;
			case Std.parseInt(_) => null: 8080;
			case Std.parseInt(_) => v: v;
			
		}
		run(new NodeContainer(port));
	}
	#end
	
	static inline function run(container:Container) {
		container.run(req -> Future.sync(('Tink HTTP Server is Running':OutgoingResponse))).handle(function(o) trace(Std.string(o)));
	}
}