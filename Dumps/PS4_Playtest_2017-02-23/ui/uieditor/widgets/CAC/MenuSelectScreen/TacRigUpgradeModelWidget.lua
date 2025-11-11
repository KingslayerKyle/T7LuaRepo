require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.TacRigUpgradeModelWidget = InheritFrom( LUI.UIElement )
CoD.TacRigUpgradeModelWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacRigUpgradeModelWidget )
	self.id = "TacRigUpgradeModelWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 180 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	BoxButtonLrgInactiveStroke:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveStroke:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactiveStroke:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgIdle:setTopBottom( 0, 1, -3, 3 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local UpgradeImage = LUI.UIImage.new()
	UpgradeImage:setLeftRight( 0, 1, 0, 0 )
	UpgradeImage:setTopBottom( 0, 1, 0, 0 )
	UpgradeImage:setAlpha( 0.25 )
	UpgradeImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			UpgradeImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( UpgradeImage )
	self.UpgradeImage = UpgradeImage
	
	local LockImage = LUI.UIImage.new()
	LockImage:setLeftRight( 1, 1, -48, 0 )
	LockImage:setTopBottom( 0, 0, 0, 48 )
	LockImage:setAlpha( 0 )
	LockImage:setImage( RegisterImage( "t7_hud_cac_lock_64" ) )
	self:addElement( LockImage )
	self.LockImage = LockImage
	
	local TokenImage = LUI.UIImage.new()
	TokenImage:setLeftRight( 1, 1, -30, 0 )
	TokenImage:setTopBottom( 0, 0, 0, 30 )
	TokenImage:setAlpha( 0 )
	TokenImage:setImage( RegisterImage( "uie_img_t7_menu_cacselection_icontokenlarge_cp" ) )
	self:addElement( TokenImage )
	self.TokenImage = TokenImage
	
	local EquippedIcon = LUI.UIImage.new()
	EquippedIcon:setLeftRight( 1, 1, -22, 0 )
	EquippedIcon:setTopBottom( 0, 0, 0, 22 )
	EquippedIcon:setRGB( 0.55, 0.77, 0.25 )
	EquippedIcon:setImage( RegisterImage( "t7_hud_cac_equipped_16" ) )
	self:addElement( EquippedIcon )
	self.EquippedIcon = EquippedIcon
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -3, 3 )
	FocusBarT:setTopBottom( 0, 0, -6, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -3, 3 )
	FocusBarB:setTopBottom( 1, 1, 0, 6 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local DebugImage = LUI.UIImage.new()
	DebugImage:setLeftRight( 0, 0, 14, 34 )
	DebugImage:setTopBottom( 0, 0, 10, 30 )
	DebugImage:setAlpha( 0 )
	self:addElement( DebugImage )
	self.DebugImage = DebugImage
	
	self.resetProperties = function ()
		UpgradeImage:completeAnimation()
		EquippedIcon:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		LockImage:completeAnimation()
		DebugImage:completeAnimation()
		TokenImage:completeAnimation()
		BoxButtonLrgIdle:completeAnimation()
		UpgradeImage:setAlpha( 0.25 )
		EquippedIcon:setRGB( 0.55, 0.77, 0.25 )
		EquippedIcon:setAlpha( 1 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		LockImage:setAlpha( 0 )
		DebugImage:setRGB( 1, 1, 1 )
		TokenImage:setAlpha( 0 )
		BoxButtonLrgIdle:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.05 )
				self.clipFinished( UpgradeImage, {} )
				EquippedIcon:completeAnimation()
				self.EquippedIcon:setRGB( 1, 1, 1 )
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.8 )
				self.clipFinished( UpgradeImage, {} )
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
				self:setupElementClipCounter( 3 )
				LockImage:completeAnimation()
				self.LockImage:setAlpha( 0.5 )
				self.clipFinished( LockImage, {} )
				EquippedIcon:completeAnimation()
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )
				DebugImage:completeAnimation()
				self.DebugImage:setRGB( 1, 0, 0 )
				self.clipFinished( DebugImage, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				LockImage:completeAnimation()
				self.LockImage:setAlpha( 0.5 )
				self.clipFinished( LockImage, {} )
				EquippedIcon:completeAnimation()
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				DebugImage:completeAnimation()
				self.DebugImage:setRGB( 1, 0, 0 )
				self.clipFinished( DebugImage, {} )
			end
		},
		NotPurchased = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.5 )
				self.clipFinished( UpgradeImage, {} )
				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 1 )
				self.clipFinished( TokenImage, {} )
				EquippedIcon:completeAnimation()
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )
				DebugImage:completeAnimation()
				self.DebugImage:setRGB( 0, 1, 0 )
				self.clipFinished( DebugImage, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.8 )
				self.clipFinished( UpgradeImage, {} )
				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 1 )
				self.clipFinished( TokenImage, {} )
				EquippedIcon:completeAnimation()
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				DebugImage:completeAnimation()
				self.DebugImage:setRGB( 0, 1, 0 )
				self.clipFinished( DebugImage, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )
			end
		},
		Available = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				DebugImage:completeAnimation()
				self.DebugImage:setRGB( 0, 0, 1 )
				self.clipFinished( DebugImage, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.8 )
				self.clipFinished( UpgradeImage, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				DebugImage:completeAnimation()
				self.DebugImage:setRGB( 0, 0, 1 )
				self.clipFinished( DebugImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		},
		{
			stateName = "NotPurchased",
			condition = function ( menu, element, event )
				return not IsCACItemPurchased( element, controller )
			end
		},
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return IsCACItemPurchased( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactiveDiag:close()
		self.BoxButtonLrgInactiveStroke:close()
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgIdle:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.UpgradeImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

