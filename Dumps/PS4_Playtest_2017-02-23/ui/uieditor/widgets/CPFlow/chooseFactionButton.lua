require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.chooseFactionButton = InheritFrom( LUI.UIElement )
CoD.chooseFactionButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseFactionButton )
	self.id = "chooseFactionButton"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 162 )
	BG:setTopBottom( 0, 0, 0, 162 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.3 )
	BG:setScale( 0.7 )
	self:addElement( BG )
	self.BG = BG
	
	local BG2 = LUI.UIImage.new()
	BG2:setLeftRight( 0, 0, 0, 162 )
	BG2:setTopBottom( 0, 0, 0, 162 )
	BG2:setRGB( 0.74, 1, 0.9 )
	BG2:setAlpha( 0 )
	BG2:setScale( 0.7 )
	BG2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	BG2:setShaderVector( 0, 0, 1, 0, 0 )
	BG2:setShaderVector( 1, 0, 0, 0, 0 )
	BG2:setShaderVector( 2, 0, 1, 0, 0 )
	BG2:setShaderVector( 3, 0, 0.7, 0, 0 )
	self:addElement( BG2 )
	self.BG2 = BG2
	
	local BG22 = LUI.UIImage.new()
	BG22:setLeftRight( 0, 0, 0, 162 )
	BG22:setTopBottom( 0, 0, 7, 11 )
	BG22:setRGB( 0.33, 0.95, 0.71 )
	BG22:setAlpha( 0 )
	BG22:setScale( 0.9 )
	self:addElement( BG22 )
	self.BG22 = BG22
	
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
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( 0, 1, -18, 10 )
	glitch:setTopBottom( 0, 0, -13, 7 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( 0, 1, -13, 13 )
	glitch2:setTopBottom( 1, 1, -9, 13 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local focusGlow = LUI.UIImage.new()
	focusGlow:setLeftRight( 0, 1, 0, 0 )
	focusGlow:setTopBottom( 0, 1, 0, 0 )
	focusGlow:setAlpha( 0 )
	focusGlow:setImage( RegisterImage( "uie_cp_genderselection_orangeglow" ) )
	self:addElement( focusGlow )
	self.focusGlow = focusGlow
	
	local OrangeLines = LUI.UIImage.new()
	OrangeLines:setLeftRight( 0, 1, 0, 0 )
	OrangeLines:setTopBottom( 0, 1, 0, 0 )
	OrangeLines:setAlpha( 0 )
	OrangeLines:setImage( RegisterImage( "uie_cp_genderselection_orangesmallerlines" ) )
	self:addElement( OrangeLines )
	self.OrangeLines = OrangeLines
	
	local OrangeSmallLines = LUI.UIImage.new()
	OrangeSmallLines:setLeftRight( 0, 1, 0, 0 )
	OrangeSmallLines:setTopBottom( 0, 1, 0, 0 )
	OrangeSmallLines:setAlpha( 0 )
	OrangeSmallLines:setImage( RegisterImage( "uie_cp_genderselection_orangelines" ) )
	self:addElement( OrangeSmallLines )
	self.OrangeSmallLines = OrangeSmallLines
	
	local factionIcon = LUI.UIImage.new()
	factionIcon:setLeftRight( 0, 1, 0, 0 )
	factionIcon:setTopBottom( 0, 1, 0, 0 )
	factionIcon:setScale( 0.7 )
	factionIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	factionIcon:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			factionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( factionIcon )
	self.factionIcon = factionIcon
	
	local focusGlow0 = LUI.UIImage.new()
	focusGlow0:setLeftRight( 0, 1, 82, 0 )
	focusGlow0:setTopBottom( 0, 1, 0, 0 )
	focusGlow0:setAlpha( 0 )
	focusGlow0:setImage( RegisterImage( "uie_cp_genderselection_orangeglow" ) )
	self:addElement( focusGlow0 )
	self.focusGlow0 = focusGlow0
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( 0, 1, 0, 0 )
	Border:setTopBottom( 0, 1, 0, 0 )
	Border:setAlpha( 0 )
	self:addElement( Border )
	self.Border = Border
	
	self.resetProperties = function ()
		factionIcon:completeAnimation()
		OrangeLines:completeAnimation()
		BG:completeAnimation()
		BG2:completeAnimation()
		BG22:completeAnimation()
		factionIcon:setAlpha( 1 )
		factionIcon:setScale( 0.7 )
		OrangeLines:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		BG:setScale( 0.7 )
		BG2:setAlpha( 0 )
		BG2:setScale( 0.7 )
		BG22:setLeftRight( 0, 0, 0, 162 )
		BG22:setTopBottom( 0, 0, 7, 11 )
		BG22:setAlpha( 0 )
		BG22:setScale( 0.9 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				factionIcon:completeAnimation()
				self.factionIcon:setAlpha( 0.6 )
				self.clipFinished( factionIcon, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local BGFrame2 = function ( BG, event )
					if not event.interrupted then
						BG:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					BG:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( BG, event )
					else
						BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:completeAnimation()
				self.BG:setScale( 0.7 )
				BGFrame2( BG, {} )
				local BG2Frame2 = function ( BG2, event )
					if not event.interrupted then
						BG2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					BG2:setAlpha( 0.03 )
					BG2:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( BG2, event )
					else
						BG2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG2:completeAnimation()
				self.BG2:setAlpha( 0 )
				self.BG2:setScale( 0.7 )
				BG2Frame2( BG2, {} )
				local BG22Frame2 = function ( BG22, event )
					if not event.interrupted then
						BG22:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					BG22:setLeftRight( 0, 0, 16, 146 )
					BG22:setTopBottom( 0, 0, 16, 19 )
					BG22:setAlpha( 0.2 )
					BG22:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BG22, event )
					else
						BG22:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 24, 138 )
				self.BG22:setTopBottom( 0, 0, 24, 28 )
				self.BG22:setAlpha( 0 )
				self.BG22:setScale( 1 )
				BG22Frame2( BG22, {} )
				OrangeLines:completeAnimation()
				self.OrangeLines:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( OrangeLines, {} )
				local factionIconFrame2 = function ( factionIcon, event )
					if not event.interrupted then
						factionIcon:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					factionIcon:setAlpha( 1 )
					factionIcon:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( factionIcon, event )
					else
						factionIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				factionIcon:completeAnimation()
				self.factionIcon:setAlpha( 0.6 )
				self.factionIcon:setScale( 0.7 )
				factionIconFrame2( factionIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BG:completeAnimation()
				self.BG:setScale( 0.8 )
				self.clipFinished( BG, {} )
				BG2:completeAnimation()
				self.BG2:setAlpha( 0.03 )
				self.BG2:setScale( 0.8 )
				self.clipFinished( BG2, {} )
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 16, 146 )
				self.BG22:setTopBottom( 0, 0, 16, 19 )
				self.BG22:setAlpha( 0.2 )
				self.BG22:setScale( 1 )
				self.clipFinished( BG22, {} )
				factionIcon:completeAnimation()
				self.factionIcon:setScale( 0.8 )
				self.clipFinished( factionIcon, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local BGFrame2 = function ( BG, event )
					if not event.interrupted then
						BG:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					BG:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( BG, event )
					else
						BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:completeAnimation()
				self.BG:setScale( 0.8 )
				BGFrame2( BG, {} )
				local BG2Frame2 = function ( BG2, event )
					if not event.interrupted then
						BG2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					BG2:setAlpha( 0 )
					BG2:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( BG2, event )
					else
						BG2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG2:completeAnimation()
				self.BG2:setAlpha( 0.03 )
				self.BG2:setScale( 0.8 )
				BG2Frame2( BG2, {} )
				local BG22Frame2 = function ( BG22, event )
					if not event.interrupted then
						BG22:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					BG22:setLeftRight( 0, 0, 24, 138 )
					BG22:setTopBottom( 0, 0, 24, 28 )
					BG22:setAlpha( 0 )
					BG22:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BG22, event )
					else
						BG22:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 16, 146 )
				self.BG22:setTopBottom( 0, 0, 16, 19 )
				self.BG22:setAlpha( 0.2 )
				self.BG22:setScale( 1 )
				BG22Frame2( BG22, {} )
				OrangeLines:completeAnimation()
				self.OrangeLines:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( OrangeLines, {} )
				local factionIconFrame2 = function ( factionIcon, event )
					if not event.interrupted then
						factionIcon:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					factionIcon:setAlpha( 0.6 )
					factionIcon:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( factionIcon, event )
					else
						factionIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				factionIcon:completeAnimation()
				self.factionIcon:setAlpha( 1 )
				self.factionIcon:setScale( 0.8 )
				factionIconFrame2( factionIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.Border:close()
		self.factionIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

