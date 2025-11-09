require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_EquipmentEmpty" )

local PostLoadFunc = function ( self, controller, menu )
	local perControllerModel = Engine.GetModelForController( controller )
	self.LethalEmpty.previousPulseValue = 0
	self.LethalEmpty:subscribeToModel( Engine.GetModel( perControllerModel, "hudItems.pulseNoLethal" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if self.LethalEmpty.previousPulseValue == modelValue then
			return 
		else
			self.LethalEmpty.previousPulseValue = modelValue
			if not PulseNoLethal( controller ) then
				return 
			else
				local LethalEmptyCopy = CoD.AmmoWidget_EquipmentEmpty.new( menu, controller )
				LethalEmptyCopy:setLeftRight( self.LethalEmpty:getLocalLeftRight() )
				LethalEmptyCopy:setTopBottom( self.LethalEmpty:getLocalTopBottom() )
				LethalEmptyCopy:setRGB( 1, 1, 1 )
				LethalEmptyCopy:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
					local modelValue = Engine.GetModelValue( model )
					if modelValue then
						LethalEmptyCopy.ImgIcon:setImage( RegisterImage( modelValue ) )
						LethalEmptyCopy.ImgIconGrow:setImage( RegisterImage( modelValue ) )
					end
				end )
				LethalEmptyCopy:registerEventHandler( "clip_over", function ( newElement, event )
					newElement:close()
				end )
				LethalEmptyCopy:setState( "Empty" )
				self:addElement( LethalEmptyCopy )
			end
		end
	end )
end

CoD.AmmoWidget_EquipmentLethalItem = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_EquipmentLethalItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_EquipmentLethalItem )
	self.id = "AmmoWidget_EquipmentLethalItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 37 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Lethal1 = LUI.UIImage.new()
	Lethal1:setLeftRight( true, false, 7.75, 33.25 )
	Lethal1:setTopBottom( true, false, 4.25, 29.75 )
	Lethal1:setRGB( 0.52, 0.52, 0.52 )
	Lethal1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Lethal1:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Lethal1:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Lethal1 )
	self.Lethal1 = Lethal1
	
	local Lethal2b = LUI.UIImage.new()
	Lethal2b:setLeftRight( true, false, 5.75, 31.25 )
	Lethal2b:setTopBottom( true, false, 3.25, 28.75 )
	Lethal2b:setRGB( 0, 0, 0 )
	Lethal2b:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Lethal2b:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Lethal2b:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Lethal2b )
	self.Lethal2b = Lethal2b
	
	local Lethal2 = LUI.UIImage.new()
	Lethal2:setLeftRight( true, false, 3.75, 29.25 )
	Lethal2:setTopBottom( true, false, 1.25, 26.75 )
	Lethal2:setRGB( 1, 1, 1 )
	Lethal2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Lethal2:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Lethal2:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Lethal2 )
	self.Lethal2 = Lethal2
	
	local Lethal3b = LUI.UIImage.new()
	Lethal3b:setLeftRight( true, false, 5.75, 31.25 )
	Lethal3b:setTopBottom( true, false, 3.25, 28.75 )
	Lethal3b:setRGB( 0, 0, 0 )
	Lethal3b:setAlpha( 0 )
	Lethal3b:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Lethal3b:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Lethal3b:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Lethal3b )
	self.Lethal3b = Lethal3b
	
	local Lethal3 = LUI.UIImage.new()
	Lethal3:setLeftRight( true, false, 6.75, 32.25 )
	Lethal3:setTopBottom( true, false, 4.25, 29.75 )
	Lethal3:setRGB( 0.52, 0.52, 0.52 )
	Lethal3:setAlpha( 0 )
	Lethal3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Lethal3:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Lethal3:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Lethal3 )
	self.Lethal3 = Lethal3
	
	local LethalEmpty = CoD.AmmoWidget_EquipmentEmpty.new( menu, controller )
	LethalEmpty:setLeftRight( true, false, 5.5, 31.5 )
	LethalEmpty:setTopBottom( true, false, 2.75, 28.75 )
	LethalEmpty:setRGB( 1, 1, 1 )
	LethalEmpty:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LethalEmpty.ImgIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	LethalEmpty:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LethalEmpty.ImgIconGrow:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( LethalEmpty )
	self.LethalEmpty = LethalEmpty
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Lethal1:completeAnimation()
				self.Lethal1:setLeftRight( true, false, 5.75, 31.25 )
				self.Lethal1:setTopBottom( true, false, 3.25, 28.75 )
				self.Lethal1:setRGB( 1, 1, 1 )
				self.Lethal1:setAlpha( 0 )
				self.clipFinished( Lethal1, {} )
				Lethal2b:completeAnimation()
				self.Lethal2b:setAlpha( 0 )
				self.clipFinished( Lethal2b, {} )
				Lethal2:completeAnimation()
				self.Lethal2:setRGB( 0.52, 0.52, 0.52 )
				self.Lethal2:setAlpha( 0 )
				self.clipFinished( Lethal2, {} )
				Lethal3b:completeAnimation()
				self.Lethal3b:setAlpha( 0 )
				self.clipFinished( Lethal3b, {} )
				Lethal3:completeAnimation()
				self.Lethal3:setRGB( 0.52, 0.52, 0.52 )
				self.Lethal3:setAlpha( 0 )
				self.clipFinished( Lethal3, {} )
				LethalEmpty:completeAnimation()
				self.LethalEmpty:setAlpha( 1 )
				self.clipFinished( LethalEmpty, {} )
			end,
			Single = function ()
				self:setupElementClipCounter( 5 )
				local Lethal1Frame2 = function ( Lethal1, event )
					if not event.interrupted then
						Lethal1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Lethal1:setLeftRight( true, false, 5.75, 31.25 )
					Lethal1:setTopBottom( true, false, 3.25, 28.75 )
					Lethal1:setRGB( 1, 1, 1 )
					Lethal1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lethal1, event )
					else
						Lethal1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal1:completeAnimation()
				self.Lethal1:setLeftRight( true, false, 5.75, 31.25 )
				self.Lethal1:setTopBottom( true, false, 3.25, 28.75 )
				self.Lethal1:setRGB( 1, 0, 0 )
				self.Lethal1:setAlpha( 0 )
				Lethal1Frame2( Lethal1, {} )
				Lethal2b:completeAnimation()
				self.Lethal2b:setAlpha( 0 )
				self.clipFinished( Lethal2b, {} )
				Lethal3b:completeAnimation()
				self.Lethal3b:setAlpha( 0 )
				self.clipFinished( Lethal3b, {} )
				Lethal3:completeAnimation()
				self.Lethal3:setAlpha( 0 )
				self.clipFinished( Lethal3, {} )
				local LethalEmptyFrame2 = function ( LethalEmpty, event )
					if not event.interrupted then
						LethalEmpty:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					LethalEmpty:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LethalEmpty, event )
					else
						LethalEmpty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LethalEmpty:completeAnimation()
				self.LethalEmpty:setAlpha( 1 )
				LethalEmptyFrame2( LethalEmpty, {} )
			end
		},
		Single = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Lethal1:completeAnimation()
				self.Lethal1:setLeftRight( true, false, 5.75, 31.25 )
				self.Lethal1:setTopBottom( true, false, 3.25, 28.75 )
				self.Lethal1:setRGB( 1, 1, 1 )
				self.Lethal1:setAlpha( 1 )
				self.clipFinished( Lethal1, {} )
				Lethal2b:completeAnimation()
				self.Lethal2b:setAlpha( 0 )
				self.clipFinished( Lethal2b, {} )
				Lethal2:completeAnimation()
				self.Lethal2:setLeftRight( true, false, 2.75, 28.25 )
				self.Lethal2:setTopBottom( true, false, 0.25, 25.75 )
				self.Lethal2:setAlpha( 0 )
				self.clipFinished( Lethal2, {} )
				Lethal3b:completeAnimation()
				self.Lethal3b:setAlpha( 0 )
				self.clipFinished( Lethal3b, {} )
				Lethal3:completeAnimation()
				self.Lethal3:setAlpha( 0 )
				self.clipFinished( Lethal3, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local Lethal1Frame2 = function ( Lethal1, event )
					if not event.interrupted then
						Lethal1:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
					end
					Lethal1:setLeftRight( true, false, 5.75, 31.25 )
					Lethal1:setTopBottom( true, false, 3.25, 28.75 )
					Lethal1:setRGB( 1, 0, 0 )
					Lethal1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Lethal1, event )
					else
						Lethal1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal1:completeAnimation()
				self.Lethal1:setLeftRight( true, false, 5.75, 31.25 )
				self.Lethal1:setTopBottom( true, false, 3.25, 28.75 )
				self.Lethal1:setRGB( 1, 1, 1 )
				self.Lethal1:setAlpha( 1 )
				Lethal1Frame2( Lethal1, {} )
				Lethal2b:completeAnimation()
				self.Lethal2b:setAlpha( 0 )
				self.clipFinished( Lethal2b, {} )
				Lethal3b:completeAnimation()
				self.Lethal3b:setAlpha( 0 )
				self.clipFinished( Lethal3b, {} )
			end,
			Double = function ()
				self:setupElementClipCounter( 4 )
				local Lethal1Frame2 = function ( Lethal1, event )
					if not event.interrupted then
						Lethal1:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Lethal1:setLeftRight( true, false, 7.75, 33.25 )
					Lethal1:setTopBottom( true, false, 4.25, 29.75 )
					Lethal1:setRGB( 0.52, 0.52, 0.52 )
					Lethal1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lethal1, event )
					else
						Lethal1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal1:completeAnimation()
				self.Lethal1:setLeftRight( true, false, 5.75, 31.25 )
				self.Lethal1:setTopBottom( true, false, 3.25, 28.75 )
				self.Lethal1:setRGB( 1, 1, 1 )
				self.Lethal1:setAlpha( 1 )
				Lethal1Frame2( Lethal1, {} )
				local Lethal2bFrame2 = function ( Lethal2b, event )
					if not event.interrupted then
						Lethal2b:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					Lethal2b:setLeftRight( true, false, 4.75, 30.25 )
					Lethal2b:setTopBottom( true, false, 2.25, 27.75 )
					Lethal2b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lethal2b, event )
					else
						Lethal2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal2b:completeAnimation()
				self.Lethal2b:setLeftRight( true, false, 4.75, 30.25 )
				self.Lethal2b:setTopBottom( true, false, 2.25, 27.75 )
				self.Lethal2b:setAlpha( 0 )
				Lethal2bFrame2( Lethal2b, {} )
				local Lethal2Frame2 = function ( Lethal2, event )
					if not event.interrupted then
						Lethal2:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Lethal2:setLeftRight( true, false, 3.75, 29.25 )
					Lethal2:setTopBottom( true, false, 1.25, 26.75 )
					Lethal2:setRGB( 1, 1, 1 )
					Lethal2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lethal2, event )
					else
						Lethal2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal2:completeAnimation()
				self.Lethal2:setLeftRight( true, false, 2.75, 28.25 )
				self.Lethal2:setTopBottom( true, false, 0.25, 25.75 )
				self.Lethal2:setRGB( 1, 0, 0 )
				self.Lethal2:setAlpha( 0 )
				Lethal2Frame2( Lethal2, {} )
				Lethal3b:completeAnimation()
				self.Lethal3b:setAlpha( 0 )
				self.clipFinished( Lethal3b, {} )
			end
		},
		Double = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Lethal1:completeAnimation()
				self.Lethal1:setLeftRight( true, false, 7.75, 33.25 )
				self.Lethal1:setTopBottom( true, false, 4.25, 29.75 )
				self.Lethal1:setRGB( 0.52, 0.52, 0.52 )
				self.Lethal1:setAlpha( 1 )
				self.clipFinished( Lethal1, {} )
				Lethal2b:completeAnimation()
				self.Lethal2b:setLeftRight( true, false, 4.75, 30.25 )
				self.Lethal2b:setTopBottom( true, false, 2.25, 27.75 )
				self.Lethal2b:setAlpha( 1 )
				self.clipFinished( Lethal2b, {} )
				Lethal2:completeAnimation()
				self.Lethal2:setLeftRight( true, false, 3.75, 29.25 )
				self.Lethal2:setTopBottom( true, false, 1.25, 26.75 )
				self.Lethal2:setRGB( 1, 1, 1 )
				self.Lethal2:setAlpha( 1 )
				self.clipFinished( Lethal2, {} )
				Lethal3b:completeAnimation()
				self.Lethal3b:setLeftRight( true, false, 0.75, 26.25 )
				self.Lethal3b:setTopBottom( true, false, -0.75, 24.75 )
				self.clipFinished( Lethal3b, {} )
				Lethal3:completeAnimation()
				self.Lethal3:setLeftRight( true, false, -0.25, 25.25 )
				self.Lethal3:setTopBottom( true, false, -2.75, 22.75 )
				self.Lethal3:setRGB( 1, 1, 1 )
				self.Lethal3:setAlpha( 0 )
				self.clipFinished( Lethal3, {} )
			end,
			Single = function ()
				self:setupElementClipCounter( 5 )
				local Lethal1Frame2 = function ( Lethal1, event )
					if not event.interrupted then
						Lethal1:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Lethal1:setLeftRight( true, false, 5.75, 31.25 )
					Lethal1:setTopBottom( true, false, 3.25, 28.75 )
					Lethal1:setRGB( 1, 1, 1 )
					Lethal1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lethal1, event )
					else
						Lethal1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal1:completeAnimation()
				self.Lethal1:setLeftRight( true, false, 7.75, 33.25 )
				self.Lethal1:setTopBottom( true, false, 4.25, 29.75 )
				self.Lethal1:setRGB( 0.52, 0.52, 0.52 )
				self.Lethal1:setAlpha( 1 )
				Lethal1Frame2( Lethal1, {} )
				local Lethal2bFrame2 = function ( Lethal2b, event )
					local Lethal2bFrame3 = function ( Lethal2b, event )
						if not event.interrupted then
							Lethal2b:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						end
						Lethal2b:setLeftRight( true, false, 2.75, 28.25 )
						Lethal2b:setTopBottom( true, false, 0.25, 25.75 )
						Lethal2b:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Lethal2b, event )
						else
							Lethal2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Lethal2bFrame3( Lethal2b, event )
						return 
					else
						Lethal2b:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						Lethal2b:setLeftRight( true, false, 3.65, 29.15 )
						Lethal2b:setTopBottom( true, false, 1.15, 26.65 )
						Lethal2b:setAlpha( 0 )
						Lethal2b:registerEventHandler( "transition_complete_keyframe", Lethal2bFrame3 )
					end
				end
				
				Lethal2b:completeAnimation()
				self.Lethal2b:setLeftRight( true, false, 4.75, 30.25 )
				self.Lethal2b:setTopBottom( true, false, 2.25, 27.75 )
				self.Lethal2b:setAlpha( 1 )
				Lethal2bFrame2( Lethal2b, {} )
				local Lethal2Frame2 = function ( Lethal2, event )
					if not event.interrupted then
						Lethal2:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Bounce )
					end
					Lethal2:setLeftRight( true, false, 2.75, 28.25 )
					Lethal2:setTopBottom( true, false, 0.25, 25.75 )
					Lethal2:setRGB( 1, 0, 0 )
					Lethal2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Lethal2, event )
					else
						Lethal2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal2:completeAnimation()
				self.Lethal2:setLeftRight( true, false, 3.75, 29.25 )
				self.Lethal2:setTopBottom( true, false, 1.25, 26.75 )
				self.Lethal2:setRGB( 1, 1, 1 )
				self.Lethal2:setAlpha( 1 )
				Lethal2Frame2( Lethal2, {} )
				Lethal3b:completeAnimation()
				self.Lethal3b:setLeftRight( true, false, 0.75, 26.25 )
				self.Lethal3b:setTopBottom( true, false, -0.75, 24.75 )
				self.Lethal3b:setAlpha( 0 )
				self.clipFinished( Lethal3b, {} )
				Lethal3:completeAnimation()
				self.Lethal3:setLeftRight( true, false, -0.25, 25.25 )
				self.Lethal3:setTopBottom( true, false, -2.75, 22.75 )
				self.Lethal3:setRGB( 1, 1, 1 )
				self.Lethal3:setAlpha( 0 )
				self.clipFinished( Lethal3, {} )
			end,
			Triple = function ()
				self:setupElementClipCounter( 5 )
				local Lethal1Frame2 = function ( Lethal1, event )
					if not event.interrupted then
						Lethal1:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Lethal1:setLeftRight( true, false, 9.75, 35.25 )
					Lethal1:setTopBottom( true, false, 5.25, 30.75 )
					Lethal1:setRGB( 0.52, 0.52, 0.52 )
					Lethal1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lethal1, event )
					else
						Lethal1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal1:completeAnimation()
				self.Lethal1:setLeftRight( true, false, 7.75, 33.25 )
				self.Lethal1:setTopBottom( true, false, 4.25, 29.75 )
				self.Lethal1:setRGB( 0.52, 0.52, 0.52 )
				self.Lethal1:setAlpha( 1 )
				Lethal1Frame2( Lethal1, {} )
				local Lethal2bFrame2 = function ( Lethal2b, event )
					if not event.interrupted then
						Lethal2b:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					Lethal2b:setLeftRight( true, false, 6.75, 32.25 )
					Lethal2b:setTopBottom( true, false, 4.25, 29.75 )
					Lethal2b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lethal2b, event )
					else
						Lethal2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal2b:completeAnimation()
				self.Lethal2b:setLeftRight( true, false, 4.75, 30.25 )
				self.Lethal2b:setTopBottom( true, false, 2.25, 27.75 )
				self.Lethal2b:setAlpha( 1 )
				Lethal2bFrame2( Lethal2b, {} )
				local Lethal2Frame2 = function ( Lethal2, event )
					if not event.interrupted then
						Lethal2:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Lethal2:setLeftRight( true, false, 5.75, 31.25 )
					Lethal2:setTopBottom( true, false, 3.25, 28.75 )
					Lethal2:setRGB( 0.52, 0.52, 0.52 )
					Lethal2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lethal2, event )
					else
						Lethal2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal2:completeAnimation()
				self.Lethal2:setLeftRight( true, false, 3.75, 29.25 )
				self.Lethal2:setTopBottom( true, false, 1.25, 26.75 )
				self.Lethal2:setRGB( 1, 1, 1 )
				self.Lethal2:setAlpha( 1 )
				Lethal2Frame2( Lethal2, {} )
				local Lethal3bFrame2 = function ( Lethal3b, event )
					if not event.interrupted then
						Lethal3b:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					Lethal3b:setLeftRight( true, false, 2.75, 28.25 )
					Lethal3b:setTopBottom( true, false, 2.25, 27.75 )
					Lethal3b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lethal3b, event )
					else
						Lethal3b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal3b:completeAnimation()
				self.Lethal3b:setLeftRight( true, false, 0.75, 26.25 )
				self.Lethal3b:setTopBottom( true, false, -0.75, 24.75 )
				self.Lethal3b:setAlpha( 0 )
				Lethal3bFrame2( Lethal3b, {} )
				local Lethal3Frame2 = function ( Lethal3, event )
					if not event.interrupted then
						Lethal3:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Lethal3:setLeftRight( true, false, 1.75, 27.25 )
					Lethal3:setTopBottom( true, false, 1.25, 26.75 )
					Lethal3:setRGB( 1, 1, 1 )
					Lethal3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lethal3, event )
					else
						Lethal3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal3:completeAnimation()
				self.Lethal3:setLeftRight( true, false, -0.25, 25.25 )
				self.Lethal3:setTopBottom( true, false, -2.75, 22.75 )
				self.Lethal3:setRGB( 1, 0, 0 )
				self.Lethal3:setAlpha( 0 )
				Lethal3Frame2( Lethal3, {} )
			end
		},
		Triple = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Lethal1:completeAnimation()
				self.Lethal1:setLeftRight( true, false, 9.75, 35.25 )
				self.Lethal1:setTopBottom( true, false, 5.25, 30.75 )
				self.Lethal1:setRGB( 0.52, 0.52, 0.52 )
				self.Lethal1:setAlpha( 1 )
				self.clipFinished( Lethal1, {} )
				Lethal2b:completeAnimation()
				self.Lethal2b:setLeftRight( true, false, 6.75, 32.25 )
				self.Lethal2b:setTopBottom( true, false, 4.25, 29.75 )
				self.Lethal2b:setAlpha( 1 )
				self.clipFinished( Lethal2b, {} )
				Lethal2:completeAnimation()
				self.Lethal2:setLeftRight( true, false, 5.75, 31.25 )
				self.Lethal2:setTopBottom( true, false, 3.25, 28.75 )
				self.Lethal2:setRGB( 0.52, 0.52, 0.52 )
				self.Lethal2:setAlpha( 1 )
				self.clipFinished( Lethal2, {} )
				Lethal3b:completeAnimation()
				self.Lethal3b:setLeftRight( true, false, 2.75, 28.25 )
				self.Lethal3b:setTopBottom( true, false, 2.25, 27.75 )
				self.Lethal3b:setAlpha( 1 )
				self.clipFinished( Lethal3b, {} )
				Lethal3:completeAnimation()
				self.Lethal3:setLeftRight( true, false, 1.75, 27.25 )
				self.Lethal3:setTopBottom( true, false, 1.25, 26.75 )
				self.Lethal3:setRGB( 1, 1, 1 )
				self.Lethal3:setAlpha( 1 )
				self.clipFinished( Lethal3, {} )
			end,
			Double = function ()
				self:setupElementClipCounter( 5 )
				local Lethal1Frame2 = function ( Lethal1, event )
					if not event.interrupted then
						Lethal1:beginAnimation( "keyframe", 400, true, false, CoD.TweenType.Back )
					end
					Lethal1:setLeftRight( true, false, 7.75, 33.25 )
					Lethal1:setTopBottom( true, false, 4.25, 29.75 )
					Lethal1:setRGB( 0.52, 0.52, 0.52 )
					Lethal1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lethal1, event )
					else
						Lethal1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal1:completeAnimation()
				self.Lethal1:setLeftRight( true, false, 9.75, 35.25 )
				self.Lethal1:setTopBottom( true, false, 5.25, 30.75 )
				self.Lethal1:setRGB( 0.52, 0.52, 0.52 )
				self.Lethal1:setAlpha( 1 )
				Lethal1Frame2( Lethal1, {} )
				local Lethal2bFrame2 = function ( Lethal2b, event )
					if not event.interrupted then
						Lethal2b:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					Lethal2b:setLeftRight( true, false, 4.75, 30.25 )
					Lethal2b:setTopBottom( true, false, 2.25, 27.75 )
					if event.interrupted then
						self.clipFinished( Lethal2b, event )
					else
						Lethal2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal2b:completeAnimation()
				self.Lethal2b:setLeftRight( true, false, 6.75, 32.25 )
				self.Lethal2b:setTopBottom( true, false, 4.25, 29.75 )
				Lethal2bFrame2( Lethal2b, {} )
				local Lethal2Frame2 = function ( Lethal2, event )
					if not event.interrupted then
						Lethal2:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Lethal2:setLeftRight( true, false, 3.75, 29.25 )
					Lethal2:setTopBottom( true, false, 1.25, 26.75 )
					Lethal2:setRGB( 1, 1, 1 )
					Lethal2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Lethal2, event )
					else
						Lethal2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal2:completeAnimation()
				self.Lethal2:setLeftRight( true, false, 5.75, 31.25 )
				self.Lethal2:setTopBottom( true, false, 3.25, 28.75 )
				self.Lethal2:setRGB( 0.52, 0.52, 0.52 )
				self.Lethal2:setAlpha( 1 )
				Lethal2Frame2( Lethal2, {} )
				local Lethal3bFrame2 = function ( Lethal3b, event )
					local Lethal3bFrame3 = function ( Lethal3b, event )
						if not event.interrupted then
							Lethal3b:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						end
						Lethal3b:setLeftRight( true, false, 0.75, 26.25 )
						Lethal3b:setTopBottom( true, false, -0.75, 24.75 )
						Lethal3b:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Lethal3b, event )
						else
							Lethal3b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Lethal3bFrame3( Lethal3b, event )
						return 
					else
						Lethal3b:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						Lethal3b:setLeftRight( true, false, 1.65, 27.15 )
						Lethal3b:setTopBottom( true, false, 0.6, 26.1 )
						Lethal3b:setAlpha( 0 )
						Lethal3b:registerEventHandler( "transition_complete_keyframe", Lethal3bFrame3 )
					end
				end
				
				Lethal3b:completeAnimation()
				self.Lethal3b:setLeftRight( true, false, 2.75, 28.25 )
				self.Lethal3b:setTopBottom( true, false, 2.25, 27.75 )
				self.Lethal3b:setAlpha( 1 )
				Lethal3bFrame2( Lethal3b, {} )
				local Lethal3Frame2 = function ( Lethal3, event )
					if not event.interrupted then
						Lethal3:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Bounce )
					end
					Lethal3:setLeftRight( true, false, -0.25, 25.25 )
					Lethal3:setTopBottom( true, false, -2.75, 22.75 )
					Lethal3:setRGB( 1, 0, 0 )
					Lethal3:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Lethal3, event )
					else
						Lethal3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Lethal3:completeAnimation()
				self.Lethal3:setLeftRight( true, false, 1.75, 27.25 )
				self.Lethal3:setTopBottom( true, false, 1.25, 26.75 )
				self.Lethal3:setRGB( 1, 1, 1 )
				self.Lethal3:setAlpha( 1 )
				Lethal3Frame2( Lethal3, {} )
			end
		}
	}
	self.close = function ( self )
		self.LethalEmpty:close()
		self.Lethal1:close()
		self.Lethal2b:close()
		self.Lethal2:close()
		self.Lethal3b:close()
		self.Lethal3:close()
		CoD.AmmoWidget_EquipmentLethalItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

