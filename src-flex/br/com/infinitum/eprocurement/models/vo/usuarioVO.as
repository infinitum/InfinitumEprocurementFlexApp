package br.com.infinitum.eprocurement.models.vo
{
	import util.IComparable;
	[RemoteClass(alias="vo.usuarioVO")]
	
	public class usuarioVO implements IComparable
	{
		public function get identifier():String
		{
			return String( id );
		}
		
		[Bindable] public var id:int;
		[Bindable] public var idtipo:int;
        [Bindable] public var tipo:String;
        [Bindable] public var nome:String;
        [Bindable] public var sobrenome:String;
        [Bindable] public var email:String;
        [Bindable] public var datacadastro:String;
	}
}