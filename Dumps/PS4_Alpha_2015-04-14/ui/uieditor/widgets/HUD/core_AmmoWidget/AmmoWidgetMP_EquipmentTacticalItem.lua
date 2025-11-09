require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidget_EquipmentEmpty" )

CoD.AmmoWidgetMP_EquipmentTacticalItem = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_EquipmentTacticalItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_EquipmentTacticalItem )
	self.id = "AmmoWidgetMP_EquipmentTacticalItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 37 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Tactical1 = LUI.UIImage.new()
	Tactical1:setLeftRight( true, false, 5.75, 31.25 )
	Tactical1:setTopBottom( true, false, 3.25, 28.75 )
	Tactical1:setRGB( 1, 1, 1 )
	Tactical1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Tactical1:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Tactical1:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Tactical1 )
	self.Tactical1 = Tactical1
	
	local Tactical2b = LUI.UIImage.new()
	Tactical2b:setLeftRight( true, false, 4.75, 30.25 )
	Tactical2b:setTopBottom( true, false, 3.25, 28.75 )
	Tactical2b:setRGB( 0, 0, 0 )
	Tactical2b:setAlpha( 0 )
	Tactical2b:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Tactical2b:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Tactical2b:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Tactical2b )
	self.Tactical2b = Tactical2b
	
	local Tactical2 = LUI.UIImage.new()
	Tactical2:setLeftRight( true, false, 2.75, 28.25 )
	Tactical2:setTopBottom( true, false, 0.25, 25.75 )
	Tactical2:setRGB( 1, 1, 1 )
	Tactical2:setAlpha( 0 )
	Tactical2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Tactical2:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Tactical2:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Tactical2 )
	self.Tactical2 = Tactical2
	
	local Tactical3b = LUI.UIImage.new()
	Tactical3b:setLeftRight( true, false, 1.75, 27.25 )
	Tactical3b:setTopBottom( true, false, -0.75, 24.75 )
	Tactical3b:setRGB( 0, 0, 0 )
	Tactical3b:setAlpha( 0 )
	Tactical3b:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Tactical3b:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Tactical3b:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Tactical3b )
	self.Tactical3b = Tactical3b
	
	local Tactical3 = LUI.UIImage.new()
	Tactical3:setLeftRight( true, false, -0.25, 25.25 )
	Tactical3:setTopBottom( true, false, -2.75, 22.75 )
	Tactical3:setRGB( 0.6, 0.6, 0.6 )
	Tactical3:setAlpha( 0 )
	Tactical3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Tactical3:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Tactical3:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Tactical3 )
	self.Tactical3 = Tactical3
	
	local TacticalEmpty = CoD.AmmoWidget_EquipmentEmpty.new( menu, controller )
	TacticalEmpty:setLeftRight( true, false, 5.5, 31.5 )
	TacticalEmpty:setTopBottom( true, false, 2.75, 28.75 )
	TacticalEmpty:setRGB( 1, 1, 1 )
	TacticalEmpty:setAlpha( 0 )
	TacticalEmpty:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacticalEmpty.ImgIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	TacticalEmpty:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TacticalEmpty.ImgIconGrow:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( TacticalEmpty )
	self.TacticalEmpty = TacticalEmpty
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 5.75, 31.25 )
				self.Tactical1:setTopBottom( true, false, 3.25, 28.75 )
				self.Tactical1:setRGB( 1, 1, 1 )
				self.Tactical1:setAlpha( 0 )
				self.clipFinished( Tactical1, {} )
				Tactical2b:completeAnimation()
				self.Tactical2b:setAlpha( 0 )
				self.clipFinished( Tactical2b, {} )
				Tactical2:completeAnimation()
				self.Tactical2:setRGB( 0.75, 0.75, 0.75 )
				self.Tactical2:setAlpha( 0 )
				self.clipFinished( Tactical2, {} )
				Tactical3b:completeAnimation()
				self.Tactical3b:setAlpha( 0 )
				self.clipFinished( Tactical3b, {} )
				Tactical3:completeAnimation()
				self.Tactical3:setRGB( 0.6, 0.6, 0.6 )
				self.Tactical3:setAlpha( 0 )
				self.clipFinished( Tactical3, {} )
				TacticalEmpty:completeAnimation()
				self.TacticalEmpty:setAlpha( 1 )
				self.clipFinished( TacticalEmpty, {} )
			end,
			Single = function ()
				self:setupElementClipCounter( 5 )
				local Tactical1Frame2 = function ( Tactical1, event )
					if not event.interrupted then
						Tactical1:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Tactical1:setLeftRight( true, false, 5.75, 31.25 )
					Tactical1:setTopBottom( true, false, 3.25, 28.75 )
					Tactical1:setRGB( 1, 1, 1 )
					Tactical1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical1, event )
					else
						Tactical1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 5.75, 31.25 )
				self.Tactical1:setTopBottom( true, false, 3.25, 28.75 )
				self.Tactical1:setRGB( 1, 1, 1 )
				self.Tactical1:setAlpha( 0 )
				Tactical1Frame2( Tactical1, {} )
				Tactical2b:completeAnimation()
				self.Tactical2b:setAlpha( 0 )
				self.clipFinished( Tactical2b, {} )
				Tactical3b:completeAnimation()
				self.Tactical3b:setAlpha( 0 )
				self.clipFinished( Tactical3b, {} )
				Tactical3:completeAnimation()
				self.Tactical3:setAlpha( 0 )
				self.clipFinished( Tactical3, {} )
				local TacticalEmptyFrame2 = function ( TacticalEmpty, event )
					if not event.interrupted then
						TacticalEmpty:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					TacticalEmpty:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( TacticalEmpty, event )
					else
						TacticalEmpty:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TacticalEmpty:completeAnimation()
				self.TacticalEmpty:setAlpha( 1 )
				TacticalEmptyFrame2( TacticalEmpty, {} )
			end
		},
		Single = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 5.75, 31.25 )
				self.Tactical1:setTopBottom( true, false, 3.25, 28.75 )
				self.Tactical1:setRGB( 1, 1, 1 )
				self.Tactical1:setAlpha( 1 )
				self.clipFinished( Tactical1, {} )
				Tactical2b:completeAnimation()
				self.Tactical2b:setAlpha( 0 )
				self.clipFinished( Tactical2b, {} )
				Tactical2:completeAnimation()
				self.Tactical2:setLeftRight( true, false, 2.75, 28.25 )
				self.Tactical2:setTopBottom( true, false, 0.25, 25.75 )
				self.Tactical2:setAlpha( 0 )
				self.clipFinished( Tactical2, {} )
				Tactical3b:completeAnimation()
				self.Tactical3b:setAlpha( 0 )
				self.clipFinished( Tactical3b, {} )
				Tactical3:completeAnimation()
				self.Tactical3:setAlpha( 0 )
				self.clipFinished( Tactical3, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local Tactical1Frame2 = function ( Tactical1, event )
					if not event.interrupted then
						Tactical1:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
					end
					Tactical1:setLeftRight( true, false, 5.75, 31.25 )
					Tactical1:setTopBottom( true, false, 3.25, 28.75 )
					Tactical1:setRGB( 1, 0, 0 )
					Tactical1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Tactical1, event )
					else
						Tactical1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 5.75, 31.25 )
				self.Tactical1:setTopBottom( true, false, 3.25, 28.75 )
				self.Tactical1:setRGB( 1, 1, 1 )
				self.Tactical1:setAlpha( 1 )
				Tactical1Frame2( Tactical1, {} )
				Tactical2b:completeAnimation()
				self.Tactical2b:setAlpha( 0 )
				self.clipFinished( Tactical2b, {} )
				Tactical3b:completeAnimation()
				self.Tactical3b:setAlpha( 0 )
				self.clipFinished( Tactical3b, {} )
			end,
			Double = function ()
				self:setupElementClipCounter( 4 )
				local Tactical1Frame2 = function ( Tactical1, event )
					if not event.interrupted then
						Tactical1:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Tactical1:setLeftRight( true, false, 10.75, 36.25 )
					Tactical1:setTopBottom( true, false, 4.25, 29.75 )
					Tactical1:setRGB( 0.52, 0.52, 0.52 )
					Tactical1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical1, event )
					else
						Tactical1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 5.75, 31.25 )
				self.Tactical1:setTopBottom( true, false, 3.25, 28.75 )
				self.Tactical1:setRGB( 1, 1, 1 )
				self.Tactical1:setAlpha( 1 )
				Tactical1Frame2( Tactical1, {} )
				local Tactical2bFrame2 = function ( Tactical2b, event )
					if not event.interrupted then
						Tactical2b:beginAnimation( "keyframe", 210, false, false, CoD.TweenType.Linear )
					end
					Tactical2b:setLeftRight( true, false, 4.75, 30.25 )
					Tactical2b:setTopBottom( true, false, 3.25, 28.75 )
					Tactical2b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical2b, event )
					else
						Tactical2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical2b:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
				Tactical2b:setLeftRight( true, false, 3.75, 29.25 )
				Tactical2b:setTopBottom( true, false, 1.25, 26.75 )
				Tactical2b:setAlpha( 0 )
				Tactical2b:registerEventHandler( "transition_complete_keyframe", Tactical2bFrame2 )
				local Tactical2Frame2 = function ( Tactical2, event )
					if not event.interrupted then
						Tactical2:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Tactical2:setLeftRight( true, false, 0.75, 26.25 )
					Tactical2:setTopBottom( true, false, 1.25, 26.75 )
					Tactical2:setRGB( 1, 1, 1 )
					Tactical2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical2, event )
					else
						Tactical2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical2:completeAnimation()
				self.Tactical2:setLeftRight( true, false, 2.75, 28.25 )
				self.Tactical2:setTopBottom( true, false, 0.25, 25.75 )
				self.Tactical2:setRGB( 1, 0, 0 )
				self.Tactical2:setAlpha( 0 )
				Tactical2Frame2( Tactical2, {} )
				Tactical3b:completeAnimation()
				self.Tactical3b:setLeftRight( true, false, 1.75, 27.25 )
				self.Tactical3b:setTopBottom( true, false, -0.75, 24.75 )
				self.Tactical3b:setAlpha( 0 )
				self.clipFinished( Tactical3b, {} )
			end
		},
		Double = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 10.75, 36.25 )
				self.Tactical1:setTopBottom( true, false, 4.25, 29.75 )
				self.Tactical1:setRGB( 0.52, 0.52, 0.52 )
				self.Tactical1:setAlpha( 1 )
				self.clipFinished( Tactical1, {} )
				Tactical2b:completeAnimation()
				self.Tactical2b:setLeftRight( true, false, 4.75, 30.25 )
				self.Tactical2b:setTopBottom( true, false, 3.25, 28.75 )
				self.Tactical2b:setAlpha( 1 )
				self.clipFinished( Tactical2b, {} )
				Tactical2:completeAnimation()
				self.Tactical2:setLeftRight( true, false, 0.75, 26.25 )
				self.Tactical2:setTopBottom( true, false, 1.25, 26.75 )
				self.Tactical2:setRGB( 1, 1, 1 )
				self.Tactical2:setAlpha( 1 )
				self.clipFinished( Tactical2, {} )
				Tactical3b:completeAnimation()
				self.Tactical3b:setAlpha( 0 )
				self.clipFinished( Tactical3b, {} )
				Tactical3:completeAnimation()
				self.Tactical3:setLeftRight( true, false, -0.25, 25.25 )
				self.Tactical3:setTopBottom( true, false, -2.75, 22.75 )
				self.Tactical3:setRGB( 1, 1, 1 )
				self.Tactical3:setAlpha( 0 )
				self.clipFinished( Tactical3, {} )
			end,
			Single = function ()
				self:setupElementClipCounter( 4 )
				local Tactical1Frame2 = function ( Tactical1, event )
					if not event.interrupted then
						Tactical1:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Tactical1:setLeftRight( true, false, 5.75, 31.25 )
					Tactical1:setTopBottom( true, false, 3.25, 28.75 )
					Tactical1:setRGB( 1, 1, 1 )
					Tactical1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical1, event )
					else
						Tactical1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 10.75, 36.25 )
				self.Tactical1:setTopBottom( true, false, 4.25, 29.75 )
				self.Tactical1:setRGB( 0.52, 0.52, 0.52 )
				self.Tactical1:setAlpha( 1 )
				Tactical1Frame2( Tactical1, {} )
				local Tactical2bFrame2 = function ( Tactical2b, event )
					if not event.interrupted then
						Tactical2b:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Tactical2b:setLeftRight( true, false, 2.75, 28.25 )
					Tactical2b:setTopBottom( true, false, 0.25, 25.75 )
					Tactical2b:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Tactical2b, event )
					else
						Tactical2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical2b:completeAnimation()
				self.Tactical2b:setLeftRight( true, false, 4.75, 30.25 )
				self.Tactical2b:setTopBottom( true, false, 3.25, 28.75 )
				self.Tactical2b:setAlpha( 1 )
				Tactical2bFrame2( Tactical2b, {} )
				local Tactical2Frame2 = function ( Tactical2, event )
					if not event.interrupted then
						Tactical2:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Bounce )
					end
					Tactical2:setLeftRight( true, false, 2.75, 28.25 )
					Tactical2:setTopBottom( true, false, 0.25, 25.75 )
					Tactical2:setRGB( 1, 0, 0 )
					Tactical2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Tactical2, event )
					else
						Tactical2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical2:completeAnimation()
				self.Tactical2:setLeftRight( true, false, 0.75, 26.25 )
				self.Tactical2:setTopBottom( true, false, 1.25, 26.75 )
				self.Tactical2:setRGB( 1, 1, 1 )
				self.Tactical2:setAlpha( 1 )
				Tactical2Frame2( Tactical2, {} )
				Tactical3:completeAnimation()
				self.Tactical3:setLeftRight( true, false, -0.25, 25.25 )
				self.Tactical3:setTopBottom( true, false, -2.75, 22.75 )
				self.Tactical3:setRGB( 1, 1, 1 )
				self.Tactical3:setAlpha( 0 )
				self.clipFinished( Tactical3, {} )
			end,
			Triple = function ()
				self:setupElementClipCounter( 5 )
				local Tactical1Frame2 = function ( Tactical1, event )
					if not event.interrupted then
						Tactical1:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Tactical1:setLeftRight( true, false, 12.75, 38.25 )
					Tactical1:setTopBottom( true, false, 5.25, 30.75 )
					Tactical1:setRGB( 0.52, 0.52, 0.52 )
					Tactical1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical1, event )
					else
						Tactical1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 10.75, 36.25 )
				self.Tactical1:setTopBottom( true, false, 4.25, 29.75 )
				self.Tactical1:setRGB( 0.52, 0.52, 0.52 )
				self.Tactical1:setAlpha( 1 )
				Tactical1Frame2( Tactical1, {} )
				local Tactical2bFrame2 = function ( Tactical2b, event )
					if not event.interrupted then
						Tactical2b:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					Tactical2b:setLeftRight( true, false, 8.75, 34.25 )
					Tactical2b:setTopBottom( true, false, 5.25, 30.75 )
					Tactical2b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical2b, event )
					else
						Tactical2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical2b:completeAnimation()
				self.Tactical2b:setLeftRight( true, false, 4.75, 30.25 )
				self.Tactical2b:setTopBottom( true, false, 3.25, 28.75 )
				self.Tactical2b:setAlpha( 1 )
				Tactical2bFrame2( Tactical2b, {} )
				local Tactical2Frame2 = function ( Tactical2, event )
					if not event.interrupted then
						Tactical2:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Tactical2:setLeftRight( true, false, 5.75, 31.25 )
					Tactical2:setTopBottom( true, false, 3.25, 28.75 )
					Tactical2:setRGB( 0.52, 0.52, 0.52 )
					Tactical2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical2, event )
					else
						Tactical2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical2:completeAnimation()
				self.Tactical2:setLeftRight( true, false, 0.75, 26.25 )
				self.Tactical2:setTopBottom( true, false, 1.25, 26.75 )
				self.Tactical2:setRGB( 1, 1, 1 )
				self.Tactical2:setAlpha( 1 )
				Tactical2Frame2( Tactical2, {} )
				local Tactical3bFrame2 = function ( Tactical3b, event )
					if not event.interrupted then
						Tactical3b:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
					end
					Tactical3b:setLeftRight( true, false, 1.75, 27.25 )
					Tactical3b:setTopBottom( true, false, 3.25, 28.75 )
					Tactical3b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical3b, event )
					else
						Tactical3b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical3b:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
				Tactical3b:setLeftRight( true, false, 1.75, 27.25 )
				Tactical3b:setTopBottom( true, false, 1.25, 26.75 )
				Tactical3b:setAlpha( 0 )
				Tactical3b:registerEventHandler( "transition_complete_keyframe", Tactical3bFrame2 )
				local Tactical3Frame2 = function ( Tactical3, event )
					if not event.interrupted then
						Tactical3:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Tactical3:setLeftRight( true, false, -1.25, 24.25 )
					Tactical3:setTopBottom( true, false, 1.25, 26.75 )
					Tactical3:setRGB( 1, 1, 1 )
					Tactical3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical3, event )
					else
						Tactical3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical3:completeAnimation()
				self.Tactical3:setLeftRight( true, false, -0.25, 25.25 )
				self.Tactical3:setTopBottom( true, false, -2.75, 22.75 )
				self.Tactical3:setRGB( 1, 0, 0 )
				self.Tactical3:setAlpha( 0 )
				Tactical3Frame2( Tactical3, {} )
			end
		},
		Triple = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 12.75, 38.25 )
				self.Tactical1:setTopBottom( true, false, 5.25, 30.75 )
				self.Tactical1:setRGB( 0.52, 0.52, 0.52 )
				self.Tactical1:setAlpha( 1 )
				self.clipFinished( Tactical1, {} )
				Tactical2b:completeAnimation()
				self.Tactical2b:setLeftRight( true, false, 8.75, 34.25 )
				self.Tactical2b:setTopBottom( true, false, 5.25, 30.75 )
				self.Tactical2b:setAlpha( 1 )
				self.clipFinished( Tactical2b, {} )
				Tactical2:completeAnimation()
				self.Tactical2:setLeftRight( true, false, 5.75, 31.25 )
				self.Tactical2:setTopBottom( true, false, 3.25, 28.75 )
				self.Tactical2:setRGB( 0.52, 0.52, 0.52 )
				self.Tactical2:setAlpha( 1 )
				self.clipFinished( Tactical2, {} )
				Tactical3b:completeAnimation()
				self.Tactical3b:setLeftRight( true, false, 1.75, 27.25 )
				self.Tactical3b:setTopBottom( true, false, 3.25, 28.75 )
				self.Tactical3b:setAlpha( 1 )
				self.clipFinished( Tactical3b, {} )
				Tactical3:completeAnimation()
				self.Tactical3:setLeftRight( true, false, -1.25, 24.25 )
				self.Tactical3:setTopBottom( true, false, 1.25, 26.75 )
				self.Tactical3:setRGB( 1, 1, 1 )
				self.Tactical3:setAlpha( 1 )
				self.clipFinished( Tactical3, {} )
			end,
			Double = function ()
				self:setupElementClipCounter( 5 )
				local Tactical1Frame2 = function ( Tactical1, event )
					if not event.interrupted then
						Tactical1:beginAnimation( "keyframe", 400, true, false, CoD.TweenType.Back )
					end
					Tactical1:setLeftRight( true, false, 10.75, 36.25 )
					Tactical1:setTopBottom( true, false, 4.25, 29.75 )
					Tactical1:setRGB( 0.52, 0.52, 0.52 )
					Tactical1:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical1, event )
					else
						Tactical1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical1:completeAnimation()
				self.Tactical1:setLeftRight( true, false, 12.75, 38.25 )
				self.Tactical1:setTopBottom( true, false, 5.25, 30.75 )
				self.Tactical1:setRGB( 0.52, 0.52, 0.52 )
				self.Tactical1:setAlpha( 1 )
				Tactical1Frame2( Tactical1, {} )
				local Tactical2bFrame2 = function ( Tactical2b, event )
					if not event.interrupted then
						Tactical2b:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Tactical2b:setLeftRight( true, false, 4.75, 30.25 )
					Tactical2b:setTopBottom( true, false, 3.25, 28.75 )
					Tactical2b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical2b, event )
					else
						Tactical2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical2b:completeAnimation()
				self.Tactical2b:setLeftRight( true, false, 8.75, 34.25 )
				self.Tactical2b:setTopBottom( true, false, 5.25, 30.75 )
				self.Tactical2b:setAlpha( 1 )
				Tactical2bFrame2( Tactical2b, {} )
				local Tactical2Frame2 = function ( Tactical2, event )
					if not event.interrupted then
						Tactical2:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Back )
					end
					Tactical2:setLeftRight( true, false, 0.75, 26.25 )
					Tactical2:setTopBottom( true, false, 1.25, 26.75 )
					Tactical2:setRGB( 1, 1, 1 )
					Tactical2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Tactical2, event )
					else
						Tactical2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical2:completeAnimation()
				self.Tactical2:setLeftRight( true, false, 5.75, 31.25 )
				self.Tactical2:setTopBottom( true, false, 3.25, 28.75 )
				self.Tactical2:setRGB( 0.52, 0.52, 0.52 )
				self.Tactical2:setAlpha( 1 )
				Tactical2Frame2( Tactical2, {} )
				local Tactical3bFrame2 = function ( Tactical3b, event )
					if not event.interrupted then
						Tactical3b:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Tactical3b:setLeftRight( true, false, 0.75, 26.25 )
					Tactical3b:setTopBottom( true, false, 0.25, 25.75 )
					Tactical3b:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Tactical3b, event )
					else
						Tactical3b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical3b:completeAnimation()
				self.Tactical3b:setLeftRight( true, false, 1.75, 27.25 )
				self.Tactical3b:setTopBottom( true, false, 3.25, 28.75 )
				self.Tactical3b:setAlpha( 1 )
				Tactical3bFrame2( Tactical3b, {} )
				local Tactical3Frame2 = function ( Tactical3, event )
					if not event.interrupted then
						Tactical3:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Bounce )
					end
					Tactical3:setLeftRight( true, false, -0.25, 25.25 )
					Tactical3:setTopBottom( true, false, -2.75, 22.75 )
					Tactical3:setRGB( 1, 0, 0 )
					Tactical3:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Tactical3, event )
					else
						Tactical3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Tactical3:completeAnimation()
				self.Tactical3:setLeftRight( true, false, -1.25, 24.25 )
				self.Tactical3:setTopBottom( true, false, 1.25, 26.75 )
				self.Tactical3:setRGB( 1, 1, 1 )
				self.Tactical3:setAlpha( 1 )
				Tactical3Frame2( Tactical3, {} )
			end
		}
	}
	self.close = function ( self )
		self.TacticalEmpty:close()
		self.Tactical1:close()
		self.Tactical2b:close()
		self.Tactical2:close()
		self.Tactical3b:close()
		self.Tactical3:close()
		CoD.AmmoWidgetMP_EquipmentTacticalItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

