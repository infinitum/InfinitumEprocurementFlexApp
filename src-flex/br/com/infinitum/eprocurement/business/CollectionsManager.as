package br.com.infinitum.eprocurement.business
{
	import mx.collections.ArrayCollection;
	
	public class CollectionsManager
	{
		public function CollectionsManager()
		{
		}
		
		public const _collectionUsuariosData:ArrayCollection = new ArrayCollection();
		
		public function set collectionUsuariosData(value:Array):void
		{
			this._collectionUsuariosData = ArrayCollection(value);
		}
		
		public function get collectionUsuariosData():void
		{
			return this._collectionUsuariosData;
		}

	}
}