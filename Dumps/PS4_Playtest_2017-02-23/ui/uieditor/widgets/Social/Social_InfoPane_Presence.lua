require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence_Joinable" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		self:setForceMouseEventDispatch( true )
	end
end

CoD.Social_InfoPane_Presence = InheritFrom( LUI.UIElement )
CoD.Social_InfoPane_Presence.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_InfoPane_Presence )
	self.id = "Social_InfoPane_Presence"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 531 )
	self:setTopBottom( 0, 0, 0, 288 )
	self.anyChildUsesUpdateState = true
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( 0, 1, 4, 0 )
	cacItemTitleGlow0:setTopBottom( 0, 0, 0, 55 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -42, 112 )
	Glow:setTopBottom( 0.5, 0.5, -141, -31 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local joinable = CoD.Social_InfoPane_Presence_Joinable.new( menu, controller )
	joinable:setLeftRight( 0, 1, 0, 0 )
	joinable:setTopBottom( 1, 1, -83.5, 15.5 )
	joinable:linkToElementModel( self, nil, false, function ( model )
		joinable:setModel( model, controller )
	end )
	self:addElement( joinable )
	self.joinable = joinable
	
	local titleContextScroller = CoD.horizontalScrollingTextBox.new( menu, controller )
	titleContextScroller:setLeftRight( 0, 1, 15, -15 )
	titleContextScroller:setTopBottom( 0, 0, 111.5, 144.5 )
	titleContextScroller:setAlpha( 0.6 )
	titleContextScroller.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	titleContextScroller.textBox:setLineSpacing( -1 )
	titleContextScroller.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleContextScroller:linkToElementModel( self, "contextString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			titleContextScroller.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( titleContextScroller )
	self.titleContextScroller = titleContextScroller
	
	local titleActivityScroller = CoD.horizontalScrollingTextBox.new( menu, controller )
	titleActivityScroller:setLeftRight( 0, 1, 15, -15 )
	titleActivityScroller:setTopBottom( 0, 0, 71.5, 104.5 )
	titleActivityScroller.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	titleActivityScroller.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleActivityScroller:linkToElementModel( self, nil, false, function ( model )
		titleActivityScroller:setModel( model, controller )
	end )
	titleActivityScroller:linkToElementModel( self, "activityString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			titleActivityScroller.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( titleActivityScroller )
	self.titleActivityScroller = titleActivityScroller
	
	local presenceIcon = LUI.UIImage.new()
	presenceIcon:setLeftRight( 0, 0, 15, 60 )
	presenceIcon:setTopBottom( 0, 0, 5, 50 )
	presenceIcon:setRGB( 0, 0, 0 )
	presenceIcon:linkToElementModel( self, "activity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			presenceIcon:setImage( RegisterImage( PresenceActivityToIcon( modelValue ) ) )
		end
	end )
	self:addElement( presenceIcon )
	self.presenceIcon = presenceIcon
	
	local presence = LUI.UITightText.new()
	presence:setLeftRight( 0, 0, 63, 516 )
	presence:setTopBottom( 0, 0, 9, 47 )
	presence:setRGB( 0, 0, 0 )
	presence:setTTF( "fonts/escom.ttf" )
	presence:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	presence:setShaderVector( 0, 0.06, 0, 0, 0 )
	presence:setShaderVector( 1, 0.02, 0, 0, 0 )
	presence:setShaderVector( 2, 1, 0, 0, 0 )
	presence:linkToElementModel( self, "activity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			presence:setText( Engine.Localize( PresenceActivityToModeString( modelValue ) ) )
		end
	end )
	self:addElement( presence )
	self.presence = presence
	
	local primaryPresence = LUI.UITightText.new()
	primaryPresence:setLeftRight( 0, 0, 12, 528 )
	primaryPresence:setTopBottom( 0, 0, 13, 51 )
	primaryPresence:setRGB( 0, 0, 0 )
	primaryPresence:setAlpha( 0 )
	primaryPresence:setTTF( "fonts/escom.ttf" )
	primaryPresence:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	primaryPresence:setShaderVector( 0, 0.06, 0, 0, 0 )
	primaryPresence:setShaderVector( 1, 0.02, 0, 0, 0 )
	primaryPresence:setShaderVector( 2, 1, 0, 0, 0 )
	primaryPresence:linkToElementModel( self, "primaryPresence", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			primaryPresence:setText( Engine.Localize( PrimaryPresenceToLocalizedString( modelValue ) ) )
		end
	end )
	self:addElement( primaryPresence )
	self.primaryPresence = primaryPresence
	
	local platformPresenceScroller = LUI.UIText.new()
	platformPresenceScroller:setLeftRight( 0, 1, 15, -15 )
	platformPresenceScroller:setTopBottom( 0, 0, 72, 105 )
	platformPresenceScroller:setAlpha( 0 )
	platformPresenceScroller:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	platformPresenceScroller:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	platformPresenceScroller:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	platformPresenceScroller:linkToElementModel( self, "platformPresence", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			platformPresenceScroller:setText( PlatformPresenceToLocalizedString( modelValue ) )
		end
	end )
	self:addElement( platformPresenceScroller )
	self.platformPresenceScroller = platformPresenceScroller
	
	self.resetProperties = function ()
		titleContextScroller:completeAnimation()
		primaryPresence:completeAnimation()
		presence:completeAnimation()
		presenceIcon:completeAnimation()
		joinable:completeAnimation()
		titleActivityScroller:completeAnimation()
		platformPresenceScroller:completeAnimation()
		titleContextScroller:setAlpha( 0.6 )
		primaryPresence:setAlpha( 0 )
		presence:setAlpha( 1 )
		presenceIcon:setLeftRight( 0, 0, 15, 60 )
		presenceIcon:setTopBottom( 0, 0, 5, 50 )
		presenceIcon:setAlpha( 1 )
		joinable:setAlpha( 1 )
		titleActivityScroller:setAlpha( 1 )
		platformPresenceScroller:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				titleContextScroller:completeAnimation()
				self.titleContextScroller:setAlpha( 1 )
				self.clipFinished( titleContextScroller, {} )
			end
		},
		ShowPlatformPresence = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				joinable:completeAnimation()
				self.joinable:setAlpha( 0 )
				self.clipFinished( joinable, {} )
				titleContextScroller:completeAnimation()
				self.titleContextScroller:setAlpha( 0 )
				self.clipFinished( titleContextScroller, {} )
				titleActivityScroller:completeAnimation()
				self.titleActivityScroller:setAlpha( 0 )
				self.clipFinished( titleActivityScroller, {} )
				presenceIcon:completeAnimation()
				self.presenceIcon:setLeftRight( 0, 0, 11, 56 )
				self.presenceIcon:setTopBottom( 0, 0, 10, 55 )
				self.presenceIcon:setAlpha( 0 )
				self.clipFinished( presenceIcon, {} )
				presence:completeAnimation()
				self.presence:setAlpha( 0 )
				self.clipFinished( presence, {} )
				primaryPresence:completeAnimation()
				self.primaryPresence:setAlpha( 1 )
				self.clipFinished( primaryPresence, {} )
				platformPresenceScroller:completeAnimation()
				self.platformPresenceScroller:setAlpha( 1 )
				self.clipFinished( platformPresenceScroller, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ShowPlatformPresence",
			condition = function ( menu, element, event )
				return not IsInTitle( self, controller )
			end
		}
	} )
	self:linkToElementModel( self, "activity", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "activity"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacItemTitleGlow0:close()
		self.joinable:close()
		self.titleContextScroller:close()
		self.titleActivityScroller:close()
		self.presenceIcon:close()
		self.presence:close()
		self.primaryPresence:close()
		self.platformPresenceScroller:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

