package br.com.infinitum.eprocurement.services
{
	import br.com.infinitum.eprocurement.models.InteractionApp;
	import br.com.infinitum.eprocurement.models.vo.autenticacaoVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class AutenticationServices
	{
		private var service:RemoteObject;
		public var objInteration:InteractionApp = new InteractionApp();
		
		private static var instance:AutenticationServices;
		public static function getInstance():AutenticationServices
		{
			if(instance == null){
				instance = new AutenticationServices();
			}
			return instance;
		}
		
		public function doAutentication(dados:autenticacaoVO,result:Function):void
		{
			var async:AsyncToken = service.doAutentication(dados);
			async.addResponder(new Responder(result, defaultFaultHandler));
		}
		
		//faultHandlers
		public function defaultFaultHandler(e:FaultEvent):void
		{
			objInteration.NotificationStart(objInteration.NotificationError,e.fault.faultString);
		}
		
		public function AutenticationServices()
		{
			service = new RemoteObject();
			service.showBusyCursor = true;
			service.destination = 'amfphp';
			service.source = 'E-procurement.services.Autenticacao';
		}

	}
}