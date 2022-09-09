-- cc1db4577104ad2d1e55976214f59ba9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgIdle" )
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
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local BoxButtonLrgInactiveStroke = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	BoxButtonLrgInactiveStroke:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveStroke:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactiveStroke:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveStroke )
	self.BoxButtonLrgInactiveStroke = BoxButtonLrgInactiveStroke
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local BoxButtonLrgIdle = CoD.cac_ButtonBoxLrgIdle.new( menu, controller )
	BoxButtonLrgIdle:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgIdle:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgIdle )
	self.BoxButtonLrgIdle = BoxButtonLrgIdle
	
	local UpgradeImage = LUI.UIImage.new()
	UpgradeImage:setLeftRight( true, true, 0, 0 )
	UpgradeImage:setTopBottom( true, true, 0, 0 )
	UpgradeImage:setAlpha( 0.25 )
	UpgradeImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			UpgradeImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( UpgradeImage )
	self.UpgradeImage = UpgradeImage
	
	local LockImage = LUI.UIImage.new()
	LockImage:setLeftRight( false, true, -32, 0 )
	LockImage:setTopBottom( true, false, 0, 32 )
	LockImage:setAlpha( 0 )
	LockImage:setImage( RegisterImage( "uie_t7_hud_cac_lock_64" ) )
	self:addElement( LockImage )
	self.LockImage = LockImage
	
	local TokenImage = LUI.UIImage.new()
	TokenImage:setLeftRight( false, true, -20, 0 )
	TokenImage:setTopBottom( true, false, 0, 20 )
	TokenImage:setAlpha( 0 )
	TokenImage:setImage( RegisterImage( "uie_img_t7_menu_cacselection_icontokenlarge_cp" ) )
	self:addElement( TokenImage )
	self.TokenImage = TokenImage
	
	local EquippedIcon = LUI.UIImage.new()
	EquippedIcon:setLeftRight( false, true, -15, 0 )
	EquippedIcon:setTopBottom( true, false, 0, 15 )
	EquippedIcon:setRGB( 0.55, 0.77, 0.25 )
	EquippedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( EquippedIcon )
	self.EquippedIcon = EquippedIcon
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -4, 0 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, 0, 4 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local DebugImage = LUI.UIImage.new()
	DebugImage:setLeftRight( true, false, 9.5, 22.5 )
	DebugImage:setTopBottom( true, false, 6.5, 19.5 )
	DebugImage:setAlpha( 0 )
	self:addElement( DebugImage )
	self.DebugImage = DebugImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.05 )
				self.clipFinished( UpgradeImage, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 0 )
				self.clipFinished( TokenImage, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setRGB( 1, 1, 1 )
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				DebugImage:completeAnimation()
				self.DebugImage:setRGB( 1, 1, 1 )
				self.clipFinished( DebugImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )

				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.8 )
				self.clipFinished( UpgradeImage, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 0 )
				self.clipFinished( TokenImage, {} )

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
				self:setupElementClipCounter( 6 )

				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.25 )
				self.clipFinished( UpgradeImage, {} )

				LockImage:completeAnimation()
				self.LockImage:setAlpha( 0.5 )
				self.clipFinished( LockImage, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				DebugImage:completeAnimation()
				self.DebugImage:setRGB( 1, 0, 0 )
				self.clipFinished( DebugImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.25 )
				self.clipFinished( UpgradeImage, {} )

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
				self:setupElementClipCounter( 7 )

				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.5 )
				self.clipFinished( UpgradeImage, {} )

				LockImage:completeAnimation()
				self.LockImage:setAlpha( 0 )
				self.clipFinished( LockImage, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setLeftRight( false, true, -20, 0 )
				self.TokenImage:setTopBottom( true, false, 0, 20 )
				self.TokenImage:setAlpha( 1 )
				self.clipFinished( TokenImage, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setAlpha( 0 )
				self.clipFinished( EquippedIcon, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				DebugImage:completeAnimation()
				self.DebugImage:setRGB( 0, 1, 0 )
				self.clipFinished( DebugImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )

				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.8 )
				self.clipFinished( UpgradeImage, {} )

				LockImage:completeAnimation()
				self.LockImage:setAlpha( 0 )
				self.clipFinished( LockImage, {} )

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
				self:setupElementClipCounter( 5 )

				BoxButtonLrgIdle:completeAnimation()
				self.BoxButtonLrgIdle:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgIdle, {} )

				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0 )
				self.clipFinished( UpgradeImage, {} )

				TokenImage:completeAnimation()
				self.TokenImage:setAlpha( 0 )
				self.clipFinished( TokenImage, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Available = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.25 )
				self.clipFinished( UpgradeImage, {} )

				LockImage:completeAnimation()
				self.LockImage:setAlpha( 0 )
				self.clipFinished( LockImage, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setAlpha( 1 )
				self.clipFinished( EquippedIcon, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				DebugImage:completeAnimation()
				self.DebugImage:setRGB( 0, 0, 1 )
				self.clipFinished( DebugImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )

				UpgradeImage:completeAnimation()
				self.UpgradeImage:setAlpha( 0.8 )
				self.clipFinished( UpgradeImage, {} )

				LockImage:completeAnimation()
				self.LockImage:setAlpha( 0 )
				self.clipFinished( LockImage, {} )

				EquippedIcon:completeAnimation()
				self.EquippedIcon:setAlpha( 1 )
				self.clipFinished( EquippedIcon, {} )

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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactiveDiag:close()
		element.BoxButtonLrgInactiveStroke:close()
		element.BoxButtonLrgInactive:close()
		element.BoxButtonLrgIdle:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.UpgradeImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
