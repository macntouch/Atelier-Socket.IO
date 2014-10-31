package server;

import js.Node;
import js.npm.Express;
import js.npm.express.Static;
import js.npm.mongoose.Mongoose;
import js.npm.Mongoose.mongoose;
import js.npm.socketio.Socket;
import js.support.DynamicObject;

using Lambda;

class Main
{
  public static function main():Void
  {
      new Main();
  }

  public function new(){
    var app = new Express();
    var server = js.node.Http.createServer(app);

    var port = untyped (process.env.PORT || 3000);

    server.listen(port, function () {
      trace('Server listening at port '+port);
    });

    // Routing
    app.use(new Static( Node.__dirname + "/public" ));  
    
    // TODO Complete
  }
}
