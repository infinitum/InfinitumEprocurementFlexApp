package br.com.infinitum.eprocurement.views
{
	import mx.containers.Canvas;
	import mx.containers.HBox;
	import mx.controls.Image;
	import mx.controls.Text;
	
	
	public class HeaderApplication extends Canvas
	{
		private var HBoxTopo:HBox;
		private var CanvasTopo:Canvas;
		private var ImgTopo:Image;
		public var TxtHeader:Text;
		
		// TODO: Cria o topo da aplicação
		public function HeaderApplication()
		{
			super();
			HBoxTopo = new HBox();
			HBoxTopo.id = "hbTopo";
			HBoxTopo.setStyle("right",0);
			HBoxTopo.height = 170;
			HBoxTopo.setStyle("top",0);
			HBoxTopo.setStyle("left",0);
			HBoxTopo.setStyle("horizontalAlign","center");
			
			CanvasTopo = new Canvas();
			CanvasTopo.id = "cvTopo";
			CanvasTopo.width = 1000;
			CanvasTopo.height = 170;
			CanvasTopo.setStyle("top",10);
			
			ImgTopo = new Image();
			ImgTopo.source = "br/com/infinitum/eprocurement/_assets/topo_principal.png";
			
			TxtHeader = new Text();
			TxtHeader.id = "txtCromp";
			TxtHeader.text = "Autenticação de Usuários";
			TxtHeader.setStyle("fontWeight","bold");
			TxtHeader.setStyle("color","#FFFFFF");
			TxtHeader.setStyle("textAlign","center");
			TxtHeader.x = 38; 
			TxtHeader.y= 120; 
			TxtHeader.width= 186;
			
			addChild(HBoxTopo);
			HBoxTopo.addChild(CanvasTopo);
			CanvasTopo.addChild(ImgTopo);
			CanvasTopo.addChild(TxtHeader);
		}

	}
}