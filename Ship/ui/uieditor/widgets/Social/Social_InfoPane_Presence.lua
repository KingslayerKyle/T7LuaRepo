-- c126c5aaa30b4d7a01a88c2caf4f2853
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence_Joinable" )
require( "ui.uieditor.widgets.horizontalScrollingTextBox" )

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
	self:setLeftRight( true, false, 0, 354 )
	self:setTopBottom( true, false, 0, 192 )
	self.anyChildUsesUpdateState = true
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, true, 0, 0 )
	cacItemTitleGlow0:setTopBottom( true, false, 0, 36.5 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -27.93, 74.07 )
	Glow:setTopBottom( false, false, -94, -21 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local joinable = CoD.Social_InfoPane_Presence_Joinable.new( menu, controller )
	joinable:setLeftRight( true, true, 0, 0 )
	joinable:setTopBottom( false, true, -56, 10 )
	joinable:linkToElementModel( self, nil, false, function ( model )
		joinable:setModel( model, controller )
	end )
	self:addElement( joinable )
	self.joinable = joinable
	
	local titleContextScroller = CoD.horizontalScrollingTextBox.new( menu, controller )
	titleContextScroller:setLeftRight( true, true, 10, -10 )
	titleContextScroller:setTopBottom( true, false, 74, 96 )
	titleContextScroller:setAlpha( 0.6 )
	titleContextScroller.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	titleContextScroller.textBox:setLineSpacing( -1 )
	titleContextScroller.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleContextScroller:linkToElementModel( self, "contextString", true, function ( model )
		local contextString = Engine.GetModelValue( model )
		if contextString then
			titleContextScroller.textBox:setText( Engine.Localize( contextString ) )
		end
	end )
	self:addElement( titleContextScroller )
	self.titleContextScroller = titleContextScroller
	
	local titleActivityScroller = CoD.horizontalScrollingTextBox.new( menu, controller )
	titleActivityScroller:setLeftRight( true, true, 10, -10 )
	titleActivityScroller:setTopBottom( true, false, 48, 70 )
	titleActivityScroller.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	titleActivityScroller.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleActivityScroller:linkToElementModel( self, nil, false, function ( model )
		titleActivityScroller:setModel( model, controller )
	end )
	titleActivityScroller:linkToElementModel( self, "activityString", true, function ( model )
		local activityString = Engine.GetModelValue( model )
		if activityString then
			titleActivityScroller.textBox:setText( Engine.Localize( activityString ) )
		end
	end )
	self:addElement( titleActivityScroller )
	self.titleActivityScroller = titleActivityScroller
	
	local presenceIcon = LUI.UIImage.new()
	presenceIcon:setLeftRight( true, false, 10, 40 )
	presenceIcon:setTopBottom( true, false, 3.5, 33.5 )
	presenceIcon:setRGB( 0, 0, 0 )
	presenceIcon:linkToElementModel( self, "activity", true, function ( model )
		local activity = Engine.GetModelValue( model )
		if activity then
			presenceIcon:setImage( RegisterImage( PresenceActivityToIcon( activity ) ) )
		end
	end )
	self:addElement( presenceIcon )
	self.presenceIcon = presenceIcon
	
	local presence = LUI.UITightText.new()
	presence:setLeftRight( true, false, 42, 344 )
	presence:setTopBottom( true, false, 6, 31 )
	presence:setRGB( 0, 0, 0 )
	presence:setTTF( "fonts/escom.ttf" )
	presence:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	presence:setShaderVector( 0, 0.06, 0, 0, 0 )
	presence:setShaderVector( 1, 0.02, 0, 0, 0 )
	presence:setShaderVector( 2, 1, 0, 0, 0 )
	presence:linkToElementModel( self, "activity", true, function ( model )
		local activity = Engine.GetModelValue( model )
		if activity then
			presence:setText( Engine.Localize( PresenceActivityToModeString( activity ) ) )
		end
	end )
	self:addElement( presence )
	self.presence = presence
	
	local primaryPresence = LUI.UITightText.new()
	primaryPresence:setLeftRight( true, false, 8, 352 )
	primaryPresence:setTopBottom( true, false, 9, 34 )
	primaryPresence:setRGB( 0, 0, 0 )
	primaryPresence:setAlpha( 0 )
	primaryPresence:setTTF( "fonts/escom.ttf" )
	primaryPresence:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	primaryPresence:setShaderVector( 0, 0.06, 0, 0, 0 )
	primaryPresence:setShaderVector( 1, 0.02, 0, 0, 0 )
	primaryPresence:setShaderVector( 2, 1, 0, 0, 0 )
	primaryPresence:linkToElementModel( self, "primaryPresence", true, function ( model )
		local _primaryPresence = Engine.GetModelValue( model )
		if _primaryPresence then
			primaryPresence:setText( Engine.Localize( PrimaryPresenceToLocalizedString( _primaryPresence ) ) )
		end
	end )
	self:addElement( primaryPresence )
	self.primaryPresence = primaryPresence
	
	local platformPresenceScroller = LUI.UIText.new()
	platformPresenceScroller:setLeftRight( true, true, 10, -10 )
	platformPresenceScroller:setTopBottom( true, false, 48, 70 )
	platformPresenceScroller:setAlpha( 0 )
	platformPresenceScroller:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	platformPresenceScroller:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	platformPresenceScroller:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	platformPresenceScroller:linkToElementModel( self, "platformPresence", true, function ( model )
		local platformPresence = Engine.GetModelValue( model )
		if platformPresence then
			platformPresenceScroller:setText( PlatformPresenceToLocalizedString( platformPresence ) )
		end
	end )
	self:addElement( platformPresenceScroller )
	self.platformPresenceScroller = platformPresenceScroller
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				cacItemTitleGlow0:completeAnimation()
				self.cacItemTitleGlow0:setAlpha( 1 )
				self.clipFinished( cacItemTitleGlow0, {} )

				joinable:completeAnimation()
				self.joinable:setAlpha( 1 )
				self.clipFinished( joinable, {} )

				titleContextScroller:completeAnimation()
				self.titleContextScroller:setAlpha( 1 )
				self.clipFinished( titleContextScroller, {} )

				titleActivityScroller:completeAnimation()
				self.titleActivityScroller:setAlpha( 1 )
				self.clipFinished( titleActivityScroller, {} )

				presenceIcon:completeAnimation()
				self.presenceIcon:setAlpha( 1 )
				self.clipFinished( presenceIcon, {} )

				presence:completeAnimation()
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )

				primaryPresence:completeAnimation()
				self.primaryPresence:setAlpha( 0 )
				self.clipFinished( primaryPresence, {} )

				platformPresenceScroller:completeAnimation()
				self.platformPresenceScroller:setAlpha( 0 )
				self.clipFinished( platformPresenceScroller, {} )
			end
		},
		ShowPlatformPresence = {
			DefaultClip = function ()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacItemTitleGlow0:close()
		element.joinable:close()
		element.titleContextScroller:close()
		element.titleActivityScroller:close()
		element.presenceIcon:close()
		element.presence:close()
		element.primaryPresence:close()
		element.platformPresenceScroller:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
