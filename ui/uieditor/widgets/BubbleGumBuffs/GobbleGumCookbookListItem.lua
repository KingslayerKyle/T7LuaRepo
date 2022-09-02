-- b49556bf5984312f81f3ab5dc250eaec
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BubbleGumBuffs.GobbleGumCookBookIcon" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.ZM_Cookbook.ZM_Cookbook_RingWidget" )
require( "ui.uieditor.widgets.ZM_Cookbook.CookbookArrow_Widget" )
require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_ConfirmationSubtext" )

local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		local f2_local1 = Engine.GetUnlockableInfoModelByIndex( modelValue, "Unlockables." .. modelValue, Enum.eModes.MODE_ZOMBIES )
		if f2_local1 then
			self.GobbleGumCookBookIcon:setModel( f2_local1 )
		end
	end )
end

CoD.GobbleGumCookbookListItem = InheritFrom( LUI.UIElement )
CoD.GobbleGumCookbookListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GobbleGumCookbookListItem )
	self.id = "GobbleGumCookbookListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 340 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 2 )
	background:setRGB( 0, 0, 0 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	local GobbleGumCookBookIcon = CoD.GobbleGumCookBookIcon.new( menu, controller )
	GobbleGumCookBookIcon:setLeftRight( true, false, 62.5, 243.5 )
	GobbleGumCookBookIcon:setTopBottom( true, false, 52.5, 233.5 )
	self:addElement( GobbleGumCookBookIcon )
	self.GobbleGumCookBookIcon = GobbleGumCookBookIcon
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -2, 2.77 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, -2, 2 )
	cacButtonBoxLrgInactiveStroke0:setAlpha( 0 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	local Name = LUI.UIText.new()
	Name:setLeftRight( true, false, 4, 300 )
	Name:setTopBottom( true, false, -47, -25 )
	Name:setRGB( 0.3, 0.2, 0.14 )
	Name:setAlpha( 0.7 )
	Name:setTTF( "fonts/default.ttf" )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	Name:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			Name:setText( LocalizeToUpperString( GetItemNameFromIndexZM( itemIndex ) ) )
		end
	end )
	self:addElement( Name )
	self.Name = Name
	
	local Count = LUI.UIText.new()
	Count:setLeftRight( false, true, -165, 103 )
	Count:setTopBottom( true, true, 128.5, -182.5 )
	Count:setRGB( 0, 0, 0 )
	Count:setAlpha( 0.9 )
	Count:setTTF( "fonts/default.ttf" )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	Count:linkToElementModel( self, "count", true, function ( model )
		local count = Engine.GetModelValue( model )
		if count then
			Count:setText( Engine.Localize( count ) )
		end
	end )
	self:addElement( Count )
	self.Count = Count
	
	local ZMCookbookRingWidget = CoD.ZM_Cookbook_RingWidget.new( menu, controller )
	ZMCookbookRingWidget:setLeftRight( true, false, 47.89, 252.89 )
	ZMCookbookRingWidget:setTopBottom( true, false, 40.5, 245.5 )
	ZMCookbookRingWidget:setAlpha( 0.7 )
	ZMCookbookRingWidget:linkToElementModel( self, nil, false, function ( model )
		ZMCookbookRingWidget:setModel( model, controller )
	end )
	ZMCookbookRingWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local percentComplete = Engine.GetModelValue( model )
		if percentComplete then
			ZMCookbookRingWidget.ring:setShaderVector( 0, ScaleVectorComponents( 0.87, 1, 1, 1, CoD.GetVectorComponentFromString( percentComplete, 1 ), CoD.GetVectorComponentFromString( percentComplete, 2 ), CoD.GetVectorComponentFromString( percentComplete, 3 ), CoD.GetVectorComponentFromString( percentComplete, 4 ) ) )
		end
	end )
	self:addElement( ZMCookbookRingWidget )
	self.ZMCookbookRingWidget = ZMCookbookRingWidget
	
	local CookbookArrowWidget0 = CoD.CookbookArrow_Widget.new( menu, controller )
	CookbookArrowWidget0:setLeftRight( true, false, -6.28, 307.05 )
	CookbookArrowWidget0:setTopBottom( true, false, 239.5, 396.17 )
	self:addElement( CookbookArrowWidget0 )
	self.CookbookArrowWidget0 = CookbookArrowWidget0
	
	local CookbookConfirmationSubtext0 = CoD.Cookbook_ConfirmationSubtext.new( menu, controller )
	CookbookConfirmationSubtext0:setLeftRight( true, false, 52, 252 )
	CookbookConfirmationSubtext0:setTopBottom( true, false, -23, -3 )
	CookbookConfirmationSubtext0:linkToElementModel( self, nil, false, function ( model )
		CookbookConfirmationSubtext0:setModel( model, controller )
	end )
	CookbookConfirmationSubtext0:mergeStateConditions( {
		{
			stateName = "Red",
			condition = function ( menu, element, event )
				return IsSelfModelValueLessThan( element, controller, "percentComplete", 1 )
			end
		},
		{
			stateName = "Green",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "percentComplete", 1 )
			end
		}
	} )
	CookbookConfirmationSubtext0:linkToElementModel( CookbookConfirmationSubtext0, "percentComplete", true, function ( model )
		menu:updateElementState( CookbookConfirmationSubtext0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "percentComplete"
		} )
	end )
	self:addElement( CookbookConfirmationSubtext0 )
	self.CookbookConfirmationSubtext0 = CookbookConfirmationSubtext0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CookbookArrowWidget0:completeAnimation()
				self.CookbookArrowWidget0:setAlpha( 0 )
				self.clipFinished( CookbookArrowWidget0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )

				CookbookArrowWidget0:completeAnimation()
				self.CookbookArrowWidget0:setAlpha( 1 )
				self.clipFinished( CookbookArrowWidget0, {} )
			end
		}
	}
	ZMCookbookRingWidget.id = "ZMCookbookRingWidget"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ZMCookbookRingWidget:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GobbleGumCookBookIcon:close()
		element.cacButtonBoxLrgInactiveStroke0:close()
		element.ZMCookbookRingWidget:close()
		element.CookbookArrowWidget0:close()
		element.CookbookConfirmationSubtext0:close()
		element.Name:close()
		element.Count:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

