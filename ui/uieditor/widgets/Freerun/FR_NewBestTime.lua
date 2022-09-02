-- 869a4f762431f5a82e15db42a4d1fb25
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "FreeRun.freeRunInfo.bestTime" ), function ( model )
		if model and Engine.GetModelValue( model ) > 0 and Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "FreeRun.runState" ) ) ~= CoD.FreerunUtility.FR_STATE_PRESTART then
			SetState( self, "Visible" )
		end
	end )
	self:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "FreeRun.runState" ), function ( model )
		if model then
			local f3_local0 = Engine.GetModelValue( model )
			if f3_local0 == CoD.FreerunUtility.FR_STATE_PRESTART or f3_local0 == CoD.FreerunUtility.FR_STATE_RUNNING then
				SetState( self, "DefaultState" )
			end
		end
	end )
end

CoD.FR_NewBestTime = InheritFrom( LUI.UIElement )
CoD.FR_NewBestTime.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FR_NewBestTime )
	self.id = "FR_NewBestTime"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 205 )
	self:setTopBottom( true, false, 0, 72 )
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, 0, 0 )
	BlackBox:setTopBottom( false, true, -51, -21 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.25 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local NewBestTime = LUI.UIImage.new()
	NewBestTime:setLeftRight( true, true, 0, 0 )
	NewBestTime:setTopBottom( false, true, -51, -21 )
	NewBestTime:setRGB( 1, 0.72, 0 )
	NewBestTime:setAlpha( 0.9 )
	NewBestTime:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NewBestTime )
	self.NewBestTime = NewBestTime
	
	local NewBestTimeText = LUI.UIText.new()
	NewBestTimeText:setLeftRight( false, false, -102.5, 102.5 )
	NewBestTimeText:setTopBottom( true, false, 26, 46 )
	NewBestTimeText:setRGB( 0, 0, 0 )
	NewBestTimeText:setText( Engine.Localize( "MENU_COURSE_BEST_TIME_SET_CAPS" ) )
	NewBestTimeText:setTTF( "fonts/escom.ttf" )
	NewBestTimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NewBestTimeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( NewBestTimeText, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 5 )
	end )
	self:addElement( NewBestTimeText )
	self.NewBestTimeText = NewBestTimeText
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, true, -7, 29 )
	Image0:setTopBottom( false, false, -15.75, -12.25 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -7, 29 )
	Image1:setTopBottom( false, false, 13.25, 16.75 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -29, 7 )
	Image2:setTopBottom( false, false, -15.75, -12.25 )
	Image2:setZRot( 180 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, -29, 7 )
	Image3:setTopBottom( false, false, 12.25, 15.75 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				self.clipFinished( BlackBox, {} )

				NewBestTime:completeAnimation()
				self.NewBestTime:setAlpha( 0 )
				self.clipFinished( NewBestTime, {} )

				NewBestTimeText:completeAnimation()
				self.NewBestTimeText:setAlpha( 0 )
				self.clipFinished( NewBestTimeText, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )

				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )

				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				self.clipFinished( Image3, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				local BlackBoxFrame2 = function ( BlackBox, event )
					local BlackBoxFrame3 = function ( BlackBox, event )
						if not event.interrupted then
							BlackBox:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Bounce )
						end
						BlackBox:setAlpha( 0.25 )
						if event.interrupted then
							self.clipFinished( BlackBox, event )
						else
							BlackBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackBoxFrame3( BlackBox, event )
						return 
					else
						BlackBox:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						BlackBox:registerEventHandler( "transition_complete_keyframe", BlackBoxFrame3 )
					end
				end
				
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0 )
				BlackBoxFrame2( BlackBox, {} )
				local NewBestTimeFrame2 = function ( NewBestTime, event )
					local NewBestTimeFrame3 = function ( NewBestTime, event )
						if not event.interrupted then
							NewBestTime:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Bounce )
						end
						NewBestTime:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( NewBestTime, event )
						else
							NewBestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NewBestTimeFrame3( NewBestTime, event )
						return 
					else
						NewBestTime:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						NewBestTime:registerEventHandler( "transition_complete_keyframe", NewBestTimeFrame3 )
					end
				end
				
				NewBestTime:completeAnimation()
				self.NewBestTime:setAlpha( 0 )
				NewBestTimeFrame2( NewBestTime, {} )
				local NewBestTimeTextFrame2 = function ( NewBestTimeText, event )
					local NewBestTimeTextFrame3 = function ( NewBestTimeText, event )
						if not event.interrupted then
							NewBestTimeText:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Bounce )
						end
						NewBestTimeText:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( NewBestTimeText, event )
						else
							NewBestTimeText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NewBestTimeTextFrame3( NewBestTimeText, event )
						return 
					else
						NewBestTimeText:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						NewBestTimeText:registerEventHandler( "transition_complete_keyframe", NewBestTimeTextFrame3 )
					end
				end
				
				NewBestTimeText:completeAnimation()
				self.NewBestTimeText:setAlpha( 0 )
				NewBestTimeTextFrame2( NewBestTimeText, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						Image0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image0, event )
						else
							Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						if not event.interrupted then
							Image1:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						Image1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image1, event )
						else
							Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					local Image2Frame3 = function ( Image2, event )
						if not event.interrupted then
							Image2:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						Image2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image2, event )
						else
							Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image2Frame3( Image2, event )
						return 
					else
						Image2:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Image2:registerEventHandler( "transition_complete_keyframe", Image2Frame3 )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					local Image3Frame3 = function ( Image3, event )
						if not event.interrupted then
							Image3:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						end
						Image3:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image3, event )
						else
							Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image3Frame3( Image3, event )
						return 
					else
						Image3:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame3 )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				Image3Frame2( Image3, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 7 )

				local BlackBoxFrame2 = function ( BlackBox, event )
					local BlackBoxFrame3 = function ( BlackBox, event )
						if not event.interrupted then
							BlackBox:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
						end
						BlackBox:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BlackBox, event )
						else
							BlackBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BlackBoxFrame3( BlackBox, event )
						return 
					else
						BlackBox:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Bounce )
						BlackBox:setAlpha( 0 )
						BlackBox:registerEventHandler( "transition_complete_keyframe", BlackBoxFrame3 )
					end
				end
				
				BlackBox:completeAnimation()
				self.BlackBox:setAlpha( 0.25 )
				BlackBoxFrame2( BlackBox, {} )
				local NewBestTimeFrame2 = function ( NewBestTime, event )
					local NewBestTimeFrame3 = function ( NewBestTime, event )
						if not event.interrupted then
							NewBestTime:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
						end
						NewBestTime:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( NewBestTime, event )
						else
							NewBestTime:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NewBestTimeFrame3( NewBestTime, event )
						return 
					else
						NewBestTime:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Bounce )
						NewBestTime:setAlpha( 0 )
						NewBestTime:registerEventHandler( "transition_complete_keyframe", NewBestTimeFrame3 )
					end
				end
				
				NewBestTime:completeAnimation()
				self.NewBestTime:setAlpha( 1 )
				NewBestTimeFrame2( NewBestTime, {} )
				local NewBestTimeTextFrame2 = function ( NewBestTimeText, event )
					local NewBestTimeTextFrame3 = function ( NewBestTimeText, event )
						if not event.interrupted then
							NewBestTimeText:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
						end
						NewBestTimeText:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( NewBestTimeText, event )
						else
							NewBestTimeText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						NewBestTimeTextFrame3( NewBestTimeText, event )
						return 
					else
						NewBestTimeText:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Bounce )
						NewBestTimeText:setAlpha( 0 )
						NewBestTimeText:registerEventHandler( "transition_complete_keyframe", NewBestTimeTextFrame3 )
					end
				end
				
				NewBestTimeText:completeAnimation()
				self.NewBestTimeText:setAlpha( 1 )
				NewBestTimeTextFrame2( NewBestTimeText, {} )
				local Image0Frame2 = function ( Image0, event )
					if not event.interrupted then
						Image0:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
					end
					Image0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image0, event )
					else
						Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				Image0Frame2( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					if not event.interrupted then
						Image1:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
					end
					Image1:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image1, event )
					else
						Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				Image1Frame2( Image1, {} )
				local Image2Frame2 = function ( Image2, event )
					if not event.interrupted then
						Image2:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
					end
					Image2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image2, event )
					else
						Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setAlpha( 1 )
				Image2Frame2( Image2, {} )
				local Image3Frame2 = function ( Image3, event )
					if not event.interrupted then
						Image3:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Linear )
					end
					Image3:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image3, event )
					else
						Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setAlpha( 1 )
				Image3Frame2( Image3, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

