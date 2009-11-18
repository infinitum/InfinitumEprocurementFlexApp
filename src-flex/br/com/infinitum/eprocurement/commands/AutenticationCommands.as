package br.com.infinitum.eprocurement.commands
{
	import br.com.infinitum.eprocurement.models.InteractionApp;
	import br.com.infinitum.eprocurement.models.vo.autenticacaoVO;
	import br.com.infinitum.eprocurement.services.AutenticationServices;
	
	import mx.rpc.events.ResultEvent;
	
	public class AutenticationCommands
	{
		private var service:AutenticationServices = AutenticationServices.getInstance();
		private var autenticaVO:autenticacaoVO;
		private var objInteration:InteractionApp = new InteractionApp();
		//public var objSessao:SessionProperties;
		
		public function AutenticationCommands()
		{
		}
		
		public function doAutentication(dados:autenticacaoVO):void
		{
			service.doAutentication(dados, autenticationHandler);
		}
		
		// TODO: Listener do método: AutenticarUsuario()
		private function autenticationHandler(e:ResultEvent):void
		{
			if(e.result) objInteration.RemoveTelaLogin(1);
			else objInteration.NotificationStart(objInteration.NotificationError,"Atenção\n\nFalha na autenticação");
			
			service = null;
			//this.getLoginData();
		}

	}
}