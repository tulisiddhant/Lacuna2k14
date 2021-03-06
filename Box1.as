package  
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Siddhant Tuli
	 * @author Anant Subramanian
	 */
	public class Box1 extends Builder
	{
		private var hei:Number;
		private var wid:Number;
		
		public function Box1(par:Sprite, pos:Point, wid:Number, hei:Number) 
		{
			
			super(pos, par);
			this.wid = wid/2;
			this.hei = hei/2;
			trace("wid", wid, "hei", hei);
		}
		
		override protected function makeBody(pos:Point):void 
		{
			var body1Def:b2BodyDef = new b2BodyDef();
			var body1Shape:b2PolygonShape = new b2PolygonShape();
			var body1FixDef:b2FixtureDef = new b2FixtureDef();
			
			body1Shape.SetAsBox(0.4* GenConstants.unitToPixels/GenConstants.RATIO, 0.4*GenConstants.unitToPixels/GenConstants.RATIO);
			body1Def.position.Set((pos.x)*GenConstants.unitToPixels/GenConstants.RATIO, (pos.y)*GenConstants.unitToPixels/GenConstants.RATIO);
			
			body1Def.type = b2Body.b2_dynamicBody;
			
			body1FixDef.shape = body1Shape;
			body1FixDef.friction = 0.8;
			body1FixDef.restitution = 0.2;
			//body1FixDef.density = 0.8;
			
			_body = GenConstants.LacWorld.CreateBody(body1Def);
			_body.CreateFixture(body1FixDef);
			
			super.makeBody(pos);
		}
		
		override protected function makeSkin(par:Sprite):void 
		{
			_skin = new boxSp();
			par.addChild(_skin);
			//_skin = new BoxSprite();
			
			super.makeSkin(par);
		}
		
		public function setAwake():void {
			_body.SetAwake(true);
		}
	}
}