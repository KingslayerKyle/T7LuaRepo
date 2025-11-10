require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.Prestige_PrestigeIconButton = InheritFrom( LUI.UIElement )
CoD.Prestige_PrestigeIconButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_PrestigeIconButton )
	self.id = "Prestige_PrestigeIconButton"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 108 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local ButtonTitleBG = LUI.UIImage.new()
	ButtonTitleBG:setLeftRight( true, true, 3, -3 )
	ButtonTitleBG:setTopBottom( false, true, -22, -5 )
	ButtonTitleBG:setRGB( 0, 0, 0 )
	ButtonTitleBG:setAlpha( 0.4 )
	self:addElement( ButtonTitleBG )
	self.ButtonTitleBG = ButtonTitleBG
	
	local ButtonTitle = LUI.UIText.new()
	ButtonTitle:setLeftRight( true, true, 5, -5 )
	ButtonTitle:setTopBottom( false, true, -19, -5 )
	ButtonTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ButtonTitle )
	self.ButtonTitle = ButtonTitle
	
	local LockIcon = CoD.cac_lock.new( menu, controller )
	LockIcon:setLeftRight( false, false, -45, 45 )
	LockIcon:setTopBottom( true, false, 5, 95 )
	LockIcon:setAlpha( 0 )
	LockIcon.lockedIcon:setAlpha( 0 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local PrestigeIcon = LUI.UIImage.new()
	PrestigeIcon:setLeftRight( false, false, -40, 40 )
	PrestigeIcon:setTopBottom( true, false, 4, 84 )
	self:addElement( PrestigeIcon )
	self.PrestigeIcon = PrestigeIcon
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.ButtonTitle:linkToElementModel( self, "buttonTitle", true, function ( model )
		local buttonTitle = Engine.GetModelValue( model )
		if buttonTitle then
			ButtonTitle:setText( Engine.Localize( buttonTitle ) )
		end
	end )
	self.PrestigeIcon:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			PrestigeIcon:setImage( RegisterImage( GetRankIconLarge( icon ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setAlpha( 1 )
				self.clipFinished( PrestigeIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )
				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setAlpha( 1 )
				self.clipFinished( PrestigeIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setAlpha( 0 )
				self.clipFinished( PrestigeIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setAlpha( 0 )
				self.clipFinished( PrestigeIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" )
			end
		}
	} )
	self:linkToElementModel( self, "isLocked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.LockIcon:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.ButtonTitle:close()
		element.PrestigeIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

