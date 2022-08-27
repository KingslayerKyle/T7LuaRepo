-- 67b860eeb627c745338c5f7b82f06dea
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 220 )
	self:setTopBottom( true, false, 0, 145 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.7 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local CategoryIcon = LUI.UIImage.new()
	CategoryIcon:setLeftRight( false, false, -48, 48 )
	CategoryIcon:setTopBottom( false, false, -59, 37 )
	CategoryIcon:linkToElementModel( self, "icon", true, function ( model )
		local icon = Engine.GetModelValue( model )
		if icon then
			CategoryIcon:setImage( RegisterImage( icon ) )
		end
	end )
	self:addElement( CategoryIcon )
	self.CategoryIcon = CategoryIcon
	
	local BlackBox0 = LUI.UIImage.new()
	BlackBox0:setLeftRight( true, true, 1, -1 )
	BlackBox0:setTopBottom( true, true, 1, -1 )
	BlackBox0:setRGB( 0, 0, 0 )
	BlackBox0:setAlpha( 0.05 )
	self:addElement( BlackBox0 )
	self.BlackBox0 = BlackBox0
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 1, -1 )
	BlackBox:setTopBottom( true, true, 1, -1 )
	BlackBox:setAlpha( 0 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
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
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 5, 217 )
	StartMenuIdentitySubTitle0:setTopBottom( false, true, -32, -5 )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StartMenuIdentitySubTitle0:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setLeftRight( false, false, -48, 48 )
				self.CategoryIcon:setTopBottom( false, false, -59, 37 )
				self.clipFinished( CategoryIcon, {} )
				BlackBox0:completeAnimation()
				self.BlackBox0:setAlpha( 0.05 )
				self.clipFinished( BlackBox0, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 1 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setLeftRight( false, false, -48, 48 )
				self.CategoryIcon:setTopBottom( false, false, -59, 37 )
				self.clipFinished( CategoryIcon, {} )
				BlackBox0:completeAnimation()
				self.BlackBox0:setAlpha( 0 )
				self.clipFinished( BlackBox0, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
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
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setLeftRight( false, false, -108.5, 108.5 )
				self.CategoryIcon:setTopBottom( false, false, -71, 71 )
				self.clipFinished( CategoryIcon, {} )
				BlackBox0:completeAnimation()
				self.BlackBox0:setAlpha( 0.05 )
				self.clipFinished( BlackBox0, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 1 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setLeftRight( false, false, -108.5, 108.5 )
				self.CategoryIcon:setTopBottom( false, false, -71, 71 )
				self.clipFinished( CategoryIcon, {} )
				BlackBox0:completeAnimation()
				self.BlackBox0:setAlpha( 0 )
				self.clipFinished( BlackBox0, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
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
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setLeftRight( false, false, -108.5, 108.5 )
				self.CategoryIcon:setTopBottom( false, false, -71, 71 )
				self.clipFinished( CategoryIcon, {} )
				BlackBox0:completeAnimation()
				self.BlackBox0:setAlpha( 0.05 )
				self.clipFinished( BlackBox0, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 1 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CategoryIcon:completeAnimation()
				self.CategoryIcon:setLeftRight( false, false, -108.5, 108.5 )
				self.CategoryIcon:setTopBottom( false, false, -71, 71 )
				self.clipFinished( CategoryIcon, {} )
				BlackBox0:completeAnimation()
				self.BlackBox0:setAlpha( 0 )
				self.clipFinished( BlackBox0, {} )
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.StartMenuIdentitySubTitle0:close()
		element.CategoryIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

