require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

CoD.Leaderboard_GameModeButton = InheritFrom( LUI.UIElement )
CoD.Leaderboard_GameModeButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Leaderboard_GameModeButton )
	self.id = "Leaderboard_GameModeButton"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( 0, 0, 0, 337 )
	self:setTopBottom( 0, 0, 0, 225 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.7 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local CategoryIcon = LUI.UIImage.new()
	CategoryIcon:setLeftRight( 0.5, 0.5, -72, 72 )
	CategoryIcon:setTopBottom( 0.5, 0.5, -88, 56 )
	CategoryIcon:linkToElementModel( self, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CategoryIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( CategoryIcon )
	self.CategoryIcon = CategoryIcon
	
	local BlackBox0 = LUI.UIImage.new()
	BlackBox0:setLeftRight( 0, 1, 4, -4 )
	BlackBox0:setTopBottom( 0, 1, 2, -6 )
	BlackBox0:setRGB( 0, 0, 0 )
	BlackBox0:setAlpha( 0.05 )
	self:addElement( BlackBox0 )
	self.BlackBox0 = BlackBox0
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( 0, 1, 4, -4 )
	BlackBox:setTopBottom( 0, 1, 2, -6 )
	BlackBox:setAlpha( 0 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
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
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( 0, 0, 8, 330 )
	StartMenuIdentitySubTitle0:setTopBottom( 1, 1, -48, -8 )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StartMenuIdentitySubTitle0:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	self.resetProperties = function ()
		BoxButtonLrgInactive:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BlackBox0:completeAnimation()
		CategoryIcon:completeAnimation()
		BoxButtonLrgInactive:setAlpha( 0.7 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		BlackBox0:setAlpha( 0.05 )
		CategoryIcon:setLeftRight( 0.5, 0.5, -72, 72 )
		CategoryIcon:setTopBottom( 0.5, 0.5, -88, 56 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BlackBox0:completeAnimation()
				self.BlackBox0:setAlpha( 0 )
				self.clipFinished( BlackBox0, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Freerun = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setLeftRight( 0.5, 0.5, -163, 163 )
				self.CategoryIcon:setTopBottom( 0.5, 0.5, -106.5, 106.5 )
				self.clipFinished( CategoryIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setLeftRight( 0.5, 0.5, -163, 163 )
				self.CategoryIcon:setTopBottom( 0.5, 0.5, -106.5, 106.5 )
				self.clipFinished( CategoryIcon, {} )
				BlackBox0:completeAnimation()
				self.BlackBox0:setAlpha( 0 )
				self.clipFinished( BlackBox0, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		ZMMaps = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setLeftRight( 0.5, 0.5, -163, 163 )
				self.CategoryIcon:setTopBottom( 0.5, 0.5, -106.5, 106.5 )
				self.clipFinished( CategoryIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setLeftRight( 0.5, 0.5, -163, 163 )
				self.CategoryIcon:setTopBottom( 0.5, 0.5, -106.5, 106.5 )
				self.clipFinished( CategoryIcon, {} )
				BlackBox0:completeAnimation()
				self.BlackBox0:setAlpha( 0 )
				self.clipFinished( BlackBox0, {} )
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
			stateName = "Freerun",
			condition = function ( menu, element, event )
				return IsFreerunLeaderboard( controller )
			end
		},
		{
			stateName = "ZMMaps",
			condition = function ( menu, element, event )
				return IsZMMapsLeaderboard( controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.StartMenuIdentitySubTitle0:close()
		self.CategoryIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

