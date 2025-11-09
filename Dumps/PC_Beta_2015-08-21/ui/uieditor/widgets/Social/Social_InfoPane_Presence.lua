require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence_Joinable" )

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
	self:setTopBottom( true, false, 0, 162 )
	self.anyChildUsesUpdateState = true
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, true, 2, -2 )
	cacItemTitleGlow0:setTopBottom( true, false, -0.5, 43.5 )
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
	joinable:setTopBottom( false, true, -38, -2 )
	joinable:linkToElementModel( self, nil, false, function ( model )
		joinable:setModel( model, controller )
	end )
	self:addElement( joinable )
	self.joinable = joinable
	
	local titleContext = LUI.UIText.new()
	titleContext:setLeftRight( true, true, 10, -10 )
	titleContext:setTopBottom( true, false, 81, 103 )
	titleContext:setAlpha( 0.55 )
	titleContext:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	titleContext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleContext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	titleContext:linkToElementModel( self, "context", true, function ( model )
		local context = Engine.GetModelValue( model )
		if context then
			titleContext:setText( PresenceContextToLocalizedString( context ) )
		end
	end )
	self:addElement( titleContext )
	self.titleContext = titleContext
	
	local titleActivity = LUI.UIText.new()
	titleActivity:setLeftRight( true, true, 10, -10 )
	titleActivity:setTopBottom( true, false, 54, 76 )
	titleActivity:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	titleActivity:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleActivity:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	titleActivity:linkToElementModel( self, "activity", true, function ( model )
		local activity = Engine.GetModelValue( model )
		if activity then
			titleActivity:setText( PresenceActivityToLocalizedString( activity ) )
		end
	end )
	self:addElement( titleActivity )
	self.titleActivity = titleActivity
	
	local presenceIcon = LUI.UIImage.new()
	presenceIcon:setLeftRight( true, false, 8, 38 )
	presenceIcon:setTopBottom( true, false, 6.5, 36.5 )
	presenceIcon:setRGB( 0, 0, 0 )
	presenceIcon:setImage( RegisterImage( "uie_t7_menu_frontend_iconmodebo3" ) )
	self:addElement( presenceIcon )
	self.presenceIcon = presenceIcon
	
	local presence = LUI.UITightText.new()
	presence:setLeftRight( true, false, 40, 352 )
	presence:setTopBottom( true, false, 11, 36 )
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
	primaryPresence:setTopBottom( true, false, 11, 36 )
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
	
	local platformPresence = LUI.UIText.new()
	platformPresence:setLeftRight( true, true, 10, -10 )
	platformPresence:setTopBottom( true, false, 54, 76 )
	platformPresence:setAlpha( 0 )
	platformPresence:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	platformPresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	platformPresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	platformPresence:linkToElementModel( self, "platformPresence", true, function ( model )
		local _platformPresence = Engine.GetModelValue( model )
		if _platformPresence then
			platformPresence:setText( PlatformPresenceToLocalizedString( _platformPresence ) )
		end
	end )
	self:addElement( platformPresence )
	self.platformPresence = platformPresence
	
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
				titleContext:completeAnimation()
				self.titleContext:setAlpha( 0.55 )
				self.clipFinished( titleContext, {} )
				titleActivity:completeAnimation()
				self.titleActivity:setAlpha( 1 )
				self.clipFinished( titleActivity, {} )
				presenceIcon:completeAnimation()
				self.presenceIcon:setAlpha( 1 )
				self.clipFinished( presenceIcon, {} )
				presence:completeAnimation()
				self.presence:setAlpha( 1 )
				self.clipFinished( presence, {} )
				primaryPresence:completeAnimation()
				self.primaryPresence:setAlpha( 0 )
				self.clipFinished( primaryPresence, {} )
				platformPresence:completeAnimation()
				self.platformPresence:setAlpha( 0 )
				self.clipFinished( platformPresence, {} )
			end
		},
		ShowPlatformPresence = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				joinable:completeAnimation()
				self.joinable:setAlpha( 0 )
				self.clipFinished( joinable, {} )
				titleContext:completeAnimation()
				self.titleContext:setAlpha( 0 )
				self.clipFinished( titleContext, {} )
				titleActivity:completeAnimation()
				self.titleActivity:setAlpha( 0 )
				self.clipFinished( titleActivity, {} )
				presenceIcon:completeAnimation()
				self.presenceIcon:setAlpha( 0 )
				self.clipFinished( presenceIcon, {} )
				presence:completeAnimation()
				self.presence:setAlpha( 0 )
				self.clipFinished( presence, {} )
				primaryPresence:completeAnimation()
				self.primaryPresence:setAlpha( 1 )
				self.clipFinished( primaryPresence, {} )
				platformPresence:completeAnimation()
				self.platformPresence:setAlpha( 1 )
				self.clipFinished( platformPresence, {} )
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
		element.titleContext:close()
		element.titleActivity:close()
		element.presence:close()
		element.primaryPresence:close()
		element.platformPresence:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

