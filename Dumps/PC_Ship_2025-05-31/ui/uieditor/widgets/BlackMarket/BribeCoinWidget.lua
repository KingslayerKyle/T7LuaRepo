require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )

CoD.BribeCoinWidget = InheritFrom( LUI.UIElement )
CoD.BribeCoinWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BribeCoinWidget )
	self.id = "BribeCoinWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 140 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local bribe = LUI.UIImage.new()
	bribe:setLeftRight( true, false, 2, 97 )
	bribe:setTopBottom( true, false, 24, 119 )
	bribe:setImage( RegisterImage( "uie_t7_blackmarket_bribe" ) )
	self:addElement( bribe )
	self.bribe = bribe
	
	local OrangeGlow = LUI.UIImage.new()
	OrangeGlow:setLeftRight( true, true, 5, -5 )
	OrangeGlow:setTopBottom( true, true, 25, -25 )
	OrangeGlow:setAlpha( 0 )
	OrangeGlow:setImage( RegisterImage( "uie_img_t7_hud_mp_weapon_hero_orangering" ) )
	self:addElement( OrangeGlow )
	self.OrangeGlow = OrangeGlow
	
	local itemHintText = CoD.ItemHintText.new( menu, controller )
	itemHintText:setLeftRight( false, false, -82, 82 )
	itemHintText:setTopBottom( false, true, 18, 48 )
	itemHintText:setAlpha( 0 )
	itemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	itemHintText:linkToElementModel( self, nil, false, function ( model )
		itemHintText:setModel( model, controller )
	end )
	itemHintText:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LeftAlign",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "RightAlign",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CenterAlign",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( itemHintText )
	self.itemHintText = itemHintText
	
	local hintArrow = CoD.HintTextArrow.new( menu, controller )
	hintArrow:setLeftRight( false, false, -5, 5 )
	hintArrow:setTopBottom( false, true, 5, 15 )
	hintArrow:setAlpha( 0 )
	hintArrow:linkToElementModel( self, nil, false, function ( model )
		hintArrow:setModel( model, controller )
	end )
	self:addElement( hintArrow )
	self.hintArrow = hintArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				bribe:completeAnimation()
				self.bribe:setLeftRight( true, false, 2, 97 )
				self.bribe:setTopBottom( true, false, 24, 119 )
				self.bribe:setAlpha( 1 )
				self.clipFinished( bribe, {} )
				OrangeGlow:completeAnimation()
				self.OrangeGlow:setRGB( 0, 0, 0 )
				self.OrangeGlow:setAlpha( 0.75 )
				self.OrangeGlow:setScale( 1 )
				self.clipFinished( OrangeGlow, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				bribe:completeAnimation()
				self.bribe:setLeftRight( true, false, 2, 97 )
				self.bribe:setTopBottom( true, false, 24, 119 )
				self.bribe:setAlpha( 1 )
				self.clipFinished( bribe, {} )
				OrangeGlow:completeAnimation()
				self.OrangeGlow:setRGB( 1, 1, 1 )
				self.OrangeGlow:setAlpha( 1 )
				self.OrangeGlow:setScale( 1.2 )
				self.clipFinished( OrangeGlow, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 1 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
			end
		},
		Equipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				OrangeGlow:completeAnimation()
				self.OrangeGlow:setRGB( 0, 0, 0 )
				self.OrangeGlow:setAlpha( 0.75 )
				self.OrangeGlow:setScale( 1 )
				self.clipFinished( OrangeGlow, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 0 )
				self.clipFinished( hintArrow, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				OrangeGlow:completeAnimation()
				self.OrangeGlow:setRGB( 1, 1, 1 )
				self.OrangeGlow:setAlpha( 1 )
				self.OrangeGlow:setScale( 1.2 )
				self.clipFinished( OrangeGlow, {} )
				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 1 )
				self.clipFinished( itemHintText, {} )
				hintArrow:completeAnimation()
				self.hintArrow:setAlpha( 1 )
				self.clipFinished( hintArrow, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.itemHintText:close()
		element.hintArrow:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

