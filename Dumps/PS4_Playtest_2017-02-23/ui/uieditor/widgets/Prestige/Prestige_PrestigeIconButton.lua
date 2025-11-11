require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

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
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, -2 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local GameTitleBG = LUI.UIImage.new()
	GameTitleBG:setLeftRight( 0, 1, 4, -4 )
	GameTitleBG:setTopBottom( 0, 0, 4, 30 )
	GameTitleBG:setRGB( 0, 0, 0 )
	GameTitleBG:setAlpha( 0.4 )
	self:addElement( GameTitleBG )
	self.GameTitleBG = GameTitleBG
	
	local IconTitleBG = LUI.UIImage.new()
	IconTitleBG:setLeftRight( 0, 1, 4, -4 )
	IconTitleBG:setTopBottom( 1, 1, -33, -7 )
	IconTitleBG:setRGB( 0, 0, 0 )
	IconTitleBG:setAlpha( 0.4 )
	self:addElement( IconTitleBG )
	self.IconTitleBG = IconTitleBG
	
	local GameTitle = LUI.UIText.new()
	GameTitle:setLeftRight( 0, 1, 10, -10 )
	GameTitle:setTopBottom( 0, 0, 6, 27 )
	GameTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	GameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameTitle )
	self.GameTitle = GameTitle
	
	local IconTitle = LUI.UIText.new()
	IconTitle:setLeftRight( 0, 1, 10, -10 )
	IconTitle:setTopBottom( 1, 1, -30, -9 )
	IconTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	IconTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	IconTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( IconTitle )
	self.IconTitle = IconTitle
	
	local LockIcon = CoD.cac_lock.new( menu, controller )
	LockIcon:setLeftRight( 0.5, 0.5, -52.5, 52.5 )
	LockIcon:setTopBottom( 0, 0, 28, 133 )
	LockIcon:setAlpha( 0 )
	LockIcon.lockedIcon:setAlpha( 0 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local PrestigeIcon = LUI.UIImage.new()
	PrestigeIcon:setLeftRight( 0.5, 0.5, -45, 45 )
	PrestigeIcon:setTopBottom( 0, 0, 35, 125 )
	self:addElement( PrestigeIcon )
	self.PrestigeIcon = PrestigeIcon
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -5, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.GameTitle:linkToElementModel( self, "gameTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.IconTitle:linkToElementModel( self, "iconTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			IconTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.PrestigeIcon:linkToElementModel( self, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PrestigeIcon:setImage( RegisterImage( GetRankIconLarge( modelValue ) ) )
		end
	end )
	self.resetProperties = function ()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		PrestigeIcon:completeAnimation()
		LockIcon:completeAnimation()
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		PrestigeIcon:setAlpha( 1 )
		LockIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setAlpha( 0 )
				self.clipFinished( PrestigeIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.LockIcon:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.GameTitle:close()
		self.IconTitle:close()
		self.PrestigeIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

