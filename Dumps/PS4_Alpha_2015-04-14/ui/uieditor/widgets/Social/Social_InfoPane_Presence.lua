require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.Social.Social_InfoPane_Presence_Joinable" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

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
	self:setLeftRight( true, false, 0, 410 )
	self:setTopBottom( true, false, 0, 162 )
	self.anyChildUsesUpdateState = true
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, true, 2, -2 )
	cacItemTitleGlow0:setTopBottom( true, true, -1, -126 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -27.93, 74.07 )
	Glow:setTopBottom( false, false, -94, -21 )
	Glow:setRGB( 1, 1, 1 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local joinable = CoD.Social_InfoPane_Presence_Joinable.new( menu, controller )
	joinable:setLeftRight( true, true, 0, 0 )
	joinable:setTopBottom( false, true, -58, -22 )
	joinable:setRGB( 1, 1, 1 )
	joinable:linkToElementModel( self, nil, false, function ( model )
		joinable:setModel( model, controller )
	end )
	self:addElement( joinable )
	self.joinable = joinable
	
	local titleContext = LUI.UIText.new()
	titleContext:setLeftRight( true, true, 10, -10 )
	titleContext:setTopBottom( true, false, 68, 87 )
	titleContext:setRGB( 1, 1, 1 )
	titleContext:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	titleContext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleContext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	titleContext:linkToElementModel( self, "context", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			titleContext:setText( PresenceContextToLocalizedString( modelValue ) )
		end
	end )
	self:addElement( titleContext )
	self.titleContext = titleContext
	
	local titleActivity = LUI.UIText.new()
	titleActivity:setLeftRight( true, true, 10, -10 )
	titleActivity:setTopBottom( true, false, 45, 64 )
	titleActivity:setRGB( 1, 1, 1 )
	titleActivity:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	titleActivity:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleActivity:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	titleActivity:linkToElementModel( self, "activity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			titleActivity:setText( PresenceActivityToLocalizedString( modelValue ) )
		end
	end )
	self:addElement( titleActivity )
	self.titleActivity = titleActivity
	
	local presenceIcon = LUI.UIImage.new()
	presenceIcon:setLeftRight( true, false, 8, 38 )
	presenceIcon:setTopBottom( true, false, 2.5, 32.5 )
	presenceIcon:setRGB( 0, 0, 0 )
	presenceIcon:setImage( RegisterImage( "uie_t7_menu_frontend_iconmodebo3" ) )
	presenceIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( presenceIcon )
	self.presenceIcon = presenceIcon
	
	local presence = LUI.UITightText.new()
	presence:setLeftRight( true, false, 40, 386 )
	presence:setTopBottom( true, false, 6, 31 )
	presence:setRGB( 0, 0, 0 )
	presence:setTTF( "fonts/Entovo.ttf" )
	presence:linkToElementModel( self, "activity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			presence:setText( Engine.Localize( PresenceActivityToModeString( modelValue ) ) )
		end
	end )
	self:addElement( presence )
	self.presence = presence
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( false, false, -44, 19 )
	StartMenuframenoBG0:setRGB( 1, 1, 1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	self.close = function ( self )
		self.cacItemTitleGlow0:close()
		self.joinable:close()
		self.StartMenuframenoBG0:close()
		self.titleContext:close()
		self.titleActivity:close()
		self.presence:close()
		CoD.Social_InfoPane_Presence.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

