require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.HintTextArrow" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.ItemHintText" )

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
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 210 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local bribe = LUI.UIImage.new()
	bribe:setLeftRight( 0, 0, 3, 145 )
	bribe:setTopBottom( 0, 0, 36, 178 )
	bribe:setImage( RegisterImage( "uie_t7_blackmarket_bribe" ) )
	self:addElement( bribe )
	self.bribe = bribe
	
	local OrangeGlow = LUI.UIImage.new()
	OrangeGlow:setLeftRight( 0, 1, 8, -8 )
	OrangeGlow:setTopBottom( 0, 1, 38, -38 )
	OrangeGlow:setAlpha( 0 )
	OrangeGlow:setImage( RegisterImage( "uie_img_t7_hud_mp_weapon_hero_orangering" ) )
	self:addElement( OrangeGlow )
	self.OrangeGlow = OrangeGlow
	
	local itemHintText = CoD.ItemHintText.new( menu, controller )
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
	itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
	itemHintText:setTopBottom( 1, 1, 27, 72 )
	itemHintText:setAlpha( 0 )
	itemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_REQUIRES_DANGER_CLOSE" ) )
	itemHintText.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	itemHintText:linkToElementModel( self, nil, false, function ( model )
		itemHintText:setModel( model, controller )
	end )
	self:addElement( itemHintText )
	self.itemHintText = itemHintText
	
	local hintArrow = CoD.HintTextArrow.new( menu, controller )
	hintArrow:setLeftRight( 0.5, 0.5, -7.5, 7.5 )
	hintArrow:setTopBottom( 1, 1, 7.5, 22.5 )
	hintArrow:setAlpha( 0 )
	hintArrow:linkToElementModel( self, nil, false, function ( model )
		hintArrow:setModel( model, controller )
	end )
	self:addElement( hintArrow )
	self.hintArrow = hintArrow
	
	self.resetProperties = function ()
		OrangeGlow:completeAnimation()
		itemHintText:completeAnimation()
		hintArrow:completeAnimation()
		OrangeGlow:setRGB( 1, 1, 1 )
		OrangeGlow:setAlpha( 0 )
		OrangeGlow:setScale( 1 )
		itemHintText:setAlpha( 0 )
		hintArrow:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				OrangeGlow:completeAnimation()
				self.OrangeGlow:setRGB( 0, 0, 0 )
				self.OrangeGlow:setAlpha( 0.75 )
				self.clipFinished( OrangeGlow, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				OrangeGlow:completeAnimation()
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				OrangeGlow:completeAnimation()
				self.OrangeGlow:setRGB( 0, 0, 0 )
				self.OrangeGlow:setAlpha( 0.75 )
				self.clipFinished( OrangeGlow, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				OrangeGlow:completeAnimation()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.itemHintText:close()
		self.hintArrow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

