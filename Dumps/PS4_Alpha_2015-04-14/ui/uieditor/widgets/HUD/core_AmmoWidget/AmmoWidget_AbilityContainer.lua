require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityRingBackDeplete" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityRingBack" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityIconContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_AbilityRing" )

CoD.AmmoWidget_AbilityContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_AbilityContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_AbilityContainer )
	self.id = "AmmoWidget_AbilityContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local AbilityRingBackDuplicate = CoD.AmmoWidget_AbilityRingBackDeplete.new( menu, controller )
	AbilityRingBackDuplicate:setLeftRight( true, true, 0, 0 )
	AbilityRingBackDuplicate:setTopBottom( true, true, 0, 0 )
	AbilityRingBackDuplicate:setRGB( 0.64, 0.66, 0.77 )
	AbilityRingBackDuplicate:setAlpha( 0 )
	AbilityRingBackDuplicate:setYRot( -180 )
	AbilityRingBackDuplicate:setZRot( 87 )
	self:addElement( AbilityRingBackDuplicate )
	self.AbilityRingBackDuplicate = AbilityRingBackDuplicate
	
	local AbilityRingBackDeplete = CoD.AmmoWidget_AbilityRingBackDeplete.new( menu, controller )
	AbilityRingBackDeplete:setLeftRight( true, true, 5.5, -5.5 )
	AbilityRingBackDeplete:setTopBottom( true, true, 5.5, -5.5 )
	AbilityRingBackDeplete:setRGB( 0.62, 0.74, 0.95 )
	AbilityRingBackDeplete:setAlpha( 0 )
	self:addElement( AbilityRingBackDeplete )
	self.AbilityRingBackDeplete = AbilityRingBackDeplete
	
	local AbilityRingBack = CoD.AmmoWidget_AbilityRingBack.new( menu, controller )
	AbilityRingBack:setLeftRight( true, true, 0, 0 )
	AbilityRingBack:setTopBottom( true, true, 0, 0 )
	AbilityRingBack:setRGB( 1, 1, 1 )
	AbilityRingBack:setAlpha( 0 )
	AbilityRingBack:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilityRingBack:setShaderVector( 0, 0.2, 1, 0, 0 )
	AbilityRingBack:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityRingBack:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityRingBack:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityRingBack:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( AbilityRingBack )
	self.AbilityRingBack = AbilityRingBack
	
	local AbilityIconContainer = CoD.AmmoWidget_AbilityIconContainer.new( menu, controller )
	AbilityIconContainer:setLeftRight( true, true, 36.17, -36.17 )
	AbilityIconContainer:setTopBottom( true, true, 32.34, -30.34 )
	AbilityIconContainer:setRGB( 1, 1, 1 )
	AbilityIconContainer:setAlpha( 0 )
	self:addElement( AbilityIconContainer )
	self.AbilityIconContainer = AbilityIconContainer
	
	local AbilityRing = CoD.AmmoWidget_AbilityRing.new( menu, controller )
	AbilityRing:setLeftRight( true, true, 0, 0 )
	AbilityRing:setTopBottom( true, true, 0, 0 )
	AbilityRing:setRGB( 1, 1, 1 )
	AbilityRing:setAlpha( 0 )
	AbilityRing:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilityRing:setShaderVector( 0, 0.2, 1, 0, 0 )
	AbilityRing:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityRing:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityRing:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityRing:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( AbilityRing )
	self.AbilityRing = AbilityRing
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				self.clipFinished( AbilityRingBack, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 0 )
				self.clipFinished( AbilityIconContainer, {} )
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 0 )
				self.clipFinished( AbilityRing, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				self.clipFinished( AbilityRingBack, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				self.clipFinished( AbilityIconContainer, {} )
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 1 )
				self.clipFinished( AbilityRing, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 4 )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local AbilityRingFrame2 = function ( AbilityRing, event )
					if not event.interrupted then
						AbilityRing:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					AbilityRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRing, event )
					else
						AbilityRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 1 )
				AbilityRingFrame2( AbilityRing, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 4 )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDuplicate:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDeplete:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 370, false, true, CoD.TweenType.Back )
					end
					AbilityRingBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local AbilityRingFrame2 = function ( AbilityRing, event )
					if not event.interrupted then
						AbilityRing:beginAnimation( "keyframe", 569, false, true, CoD.TweenType.Back )
					end
					AbilityRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRing, event )
					else
						AbilityRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 1 )
				AbilityRingFrame2( AbilityRing, {} )
			end,
			Stowed = function ()
				self:setupElementClipCounter( 4 )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 360, false, true, CoD.TweenType.Back )
					end
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local AbilityRingFrame2 = function ( AbilityRing, event )
					if not event.interrupted then
						AbilityRing:beginAnimation( "keyframe", 639, false, true, CoD.TweenType.Back )
					end
					AbilityRing:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRing, event )
					else
						AbilityRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 1 )
				AbilityRingFrame2( AbilityRing, {} )
			end
		},
		Charge = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				self.clipFinished( AbilityRingBack, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				self.clipFinished( AbilityIconContainer, {} )
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 1 )
				self.clipFinished( AbilityRing, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 4 )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local AbilityRingFrame2 = function ( AbilityRing, event )
					if not event.interrupted then
						AbilityRing:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					AbilityRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRing, event )
					else
						AbilityRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 1 )
				AbilityRingFrame2( AbilityRing, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 4 )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDuplicate:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 569, false, true, CoD.TweenType.Back )
					end
					AbilityRingBackDeplete:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 280, false, true, CoD.TweenType.Back )
					end
					AbilityRingBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local AbilityRingFrame2 = function ( AbilityRing, event )
					if not event.interrupted then
						AbilityRing:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					AbilityRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRing, event )
					else
						AbilityRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 1 )
				AbilityRingFrame2( AbilityRing, {} )
			end,
			Stowed = function ()
				self:setupElementClipCounter( 4 )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 360, false, true, CoD.TweenType.Back )
					end
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 620, false, true, CoD.TweenType.Back )
					end
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local AbilityRingFrame2 = function ( AbilityRing, event )
					if not event.interrupted then
						AbilityRing:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					AbilityRing:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRing, event )
					else
						AbilityRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 1 )
				AbilityRingFrame2( AbilityRing, {} )
			end
		},
		InUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 1 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 1 )
				self.clipFinished( AbilityRingBack, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				self.clipFinished( AbilityIconContainer, {} )
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 1 )
				self.clipFinished( AbilityRing, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 4 )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDuplicate:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 560, false, true, CoD.TweenType.Back )
					end
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 1 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 779, false, true, CoD.TweenType.Back )
					end
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 1 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local AbilityRingFrame2 = function ( AbilityRing, event )
					if not event.interrupted then
						AbilityRing:beginAnimation( "keyframe", 349, false, true, CoD.TweenType.Back )
					end
					AbilityRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRing, event )
					else
						AbilityRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 1 )
				AbilityRingFrame2( AbilityRing, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 4 )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 709, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDuplicate:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 560, false, true, CoD.TweenType.Back )
					end
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 1 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 899, false, true, CoD.TweenType.Back )
					end
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 1 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local AbilityRingFrame2 = function ( AbilityRing, event )
					if not event.interrupted then
						AbilityRing:beginAnimation( "keyframe", 660, false, true, CoD.TweenType.Back )
					end
					AbilityRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRing, event )
					else
						AbilityRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 1 )
				AbilityRingFrame2( AbilityRing, {} )
			end,
			Stowed = function ()
				self:setupElementClipCounter( 4 )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDuplicate:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0.7 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 699, false, true, CoD.TweenType.Back )
					end
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 1 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 870, false, true, CoD.TweenType.Back )
					end
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 1 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local AbilityRingFrame2 = function ( AbilityRing, event )
					if not event.interrupted then
						AbilityRing:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					AbilityRing:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRing, event )
					else
						AbilityRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 1 )
				AbilityRingFrame2( AbilityRing, {} )
			end
		},
		Stowed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDeplete, {} )
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				self.clipFinished( AbilityRingBack, {} )
				AbilityIconContainer:completeAnimation()
				self.AbilityIconContainer:setAlpha( 1 )
				self.clipFinished( AbilityIconContainer, {} )
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 0 )
				self.clipFinished( AbilityRing, {} )
			end,
			Ready = function ()
				self:setupElementClipCounter( 4 )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 740, false, true, CoD.TweenType.Back )
					end
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local AbilityRingFrame2 = function ( AbilityRing, event )
					if not event.interrupted then
						AbilityRing:beginAnimation( "keyframe", 560, false, true, CoD.TweenType.Back )
					end
					AbilityRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRing, event )
					else
						AbilityRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 0 )
				AbilityRingFrame2( AbilityRing, {} )
			end,
			Charge = function ()
				self:setupElementClipCounter( 4 )
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				self.clipFinished( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 409, false, true, CoD.TweenType.Back )
					end
					AbilityRingBackDeplete:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 579, false, true, CoD.TweenType.Back )
					end
					AbilityRingBack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local AbilityRingFrame2 = function ( AbilityRing, event )
					if not event.interrupted then
						AbilityRing:beginAnimation( "keyframe", 759, false, true, CoD.TweenType.Back )
					end
					AbilityRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRing, event )
					else
						AbilityRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 0 )
				AbilityRingFrame2( AbilityRing, {} )
			end,
			InUse = function ()
				self:setupElementClipCounter( 4 )
				local AbilityRingBackDuplicateFrame2 = function ( AbilityRingBackDuplicate, event )
					if not event.interrupted then
						AbilityRingBackDuplicate:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
					end
					AbilityRingBackDuplicate:setAlpha( 0.7 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDuplicate, event )
					else
						AbilityRingBackDuplicate:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDuplicate:completeAnimation()
				self.AbilityRingBackDuplicate:setAlpha( 0 )
				AbilityRingBackDuplicateFrame2( AbilityRingBackDuplicate, {} )
				local AbilityRingBackDepleteFrame2 = function ( AbilityRingBackDeplete, event )
					if not event.interrupted then
						AbilityRingBackDeplete:beginAnimation( "keyframe", 500, false, true, CoD.TweenType.Back )
					end
					AbilityRingBackDeplete:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBackDeplete, event )
					else
						AbilityRingBackDeplete:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBackDeplete:completeAnimation()
				self.AbilityRingBackDeplete:setAlpha( 0 )
				AbilityRingBackDepleteFrame2( AbilityRingBackDeplete, {} )
				local AbilityRingBackFrame2 = function ( AbilityRingBack, event )
					if not event.interrupted then
						AbilityRingBack:beginAnimation( "keyframe", 649, false, true, CoD.TweenType.Back )
					end
					AbilityRingBack:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRingBack, event )
					else
						AbilityRingBack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRingBack:completeAnimation()
				self.AbilityRingBack:setAlpha( 0 )
				AbilityRingBackFrame2( AbilityRingBack, {} )
				local AbilityRingFrame2 = function ( AbilityRing, event )
					if not event.interrupted then
						AbilityRing:beginAnimation( "keyframe", 790, false, true, CoD.TweenType.Back )
					end
					AbilityRing:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( AbilityRing, event )
					else
						AbilityRing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				AbilityRing:completeAnimation()
				self.AbilityRing:setAlpha( 0 )
				AbilityRingFrame2( AbilityRing, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
			end
		},
		{
			stateName = "Charge",
			condition = function ( menu, element, event )
				return IsHeroWeaponGadgetAmmoEmpty( menu, controller )
			end
		},
		{
			stateName = "InUse",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller )
			end
		},
		{
			stateName = "Stowed",
			condition = function ( menu, element, event )
				local f64_local0
				if not IsHeroWeaponGadgetAmmoEmpty( menu, controller ) and not IsHeroWeaponGadgetCurrentWeapon( menu, controller ) then
					f64_local0 = IsHeroWeaponGadgetAvailable( menu, controller )
					if f64_local0 then
						f64_local0 = WasHeroWeaponGadgetActivated( menu )
					end
				else
					f64_local0 = false
				end
				return f64_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.ammo" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.ammo"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self.close = function ( self )
		self.AbilityRingBackDuplicate:close()
		self.AbilityRingBackDeplete:close()
		self.AbilityRingBack:close()
		self.AbilityIconContainer:close()
		self.AbilityRing:close()
		CoD.AmmoWidget_AbilityContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

