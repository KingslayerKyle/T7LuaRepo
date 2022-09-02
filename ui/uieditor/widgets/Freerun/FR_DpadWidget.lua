-- d907cabdf73e8f3b9c4b29c600227f51
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Freerun.freerun_DpadBoxBlur" )
require( "ui.uieditor.widgets.buttonprompt_small" )

CoD.FR_DpadWidget = InheritFrom( LUI.UIElement )
CoD.FR_DpadWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.FR_DpadWidget )
	self.id = "FR_DpadWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 287 )
	self:setTopBottom( true, false, 0, 121 )
	self.anyChildUsesUpdateState = true
	
	local freerunDpadBoxBlur = CoD.freerun_DpadBoxBlur.new( menu, controller )
	freerunDpadBoxBlur:setLeftRight( true, false, 0, 287 )
	freerunDpadBoxBlur:setTopBottom( true, false, 32.53, 115 )
	freerunDpadBoxBlur:setRGB( 0.77, 0.77, 0.77 )
	self:addElement( freerunDpadBoxBlur )
	self.freerunDpadBoxBlur = freerunDpadBoxBlur
	
	local Box1 = LUI.UIImage.new()
	Box1:setLeftRight( true, false, 14.37, 227.13 )
	Box1:setTopBottom( true, false, 81.24, 111.91 )
	Box1:setRGB( 0, 0, 0 )
	Box1:setAlpha( 0.2 )
	Box1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Box1:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( Box1 )
	self.Box1 = Box1
	
	local Box2 = LUI.UIImage.new()
	Box2:setLeftRight( true, false, 14.37, 227.13 )
	Box2:setTopBottom( true, false, 49.24, 79.91 )
	Box2:setRGB( 0, 0, 0 )
	Box2:setAlpha( 0.2 )
	Box2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	Box2:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( Box2 )
	self.Box2 = Box2
	
	local ChangeCourseBox = LUI.UIImage.new()
	ChangeCourseBox:setLeftRight( true, true, 46.58, -121 )
	ChangeCourseBox:setTopBottom( true, true, 41.74, -43.67 )
	ChangeCourseBox:setRGB( 0, 0, 0 )
	ChangeCourseBox:setAlpha( 0 )
	ChangeCourseBox:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_besttimebottom" ) )
	self:addElement( ChangeCourseBox )
	self.ChangeCourseBox = ChangeCourseBox
	
	local ChangeTrackButtonPrompt = CoD.buttonprompt_small.new( menu, controller )
	ChangeTrackButtonPrompt:setLeftRight( true, false, 28, 242 )
	ChangeTrackButtonPrompt:setTopBottom( true, false, 45.24, 76.24 )
	ChangeTrackButtonPrompt:setAlpha( 0 )
	ChangeTrackButtonPrompt.label:setText( Engine.Localize( "CHANGE COURSE" ) )
	ChangeTrackButtonPrompt:subscribeToGlobalModel( controller, "Controller", "dpad_lr_button_image", function ( model )
		local dpadLrButtonImage = Engine.GetModelValue( model )
		if dpadLrButtonImage then
			ChangeTrackButtonPrompt.buttonPromptImage:setImage( RegisterImage( dpadLrButtonImage ) )
		end
	end )
	self:addElement( ChangeTrackButtonPrompt )
	self.ChangeTrackButtonPrompt = ChangeTrackButtonPrompt
	
	local DpadBoxLineBottom = LUI.UIImage.new()
	DpadBoxLineBottom:setLeftRight( true, true, 10.5, -56 )
	DpadBoxLineBottom:setTopBottom( true, true, 105.57, -3.67 )
	DpadBoxLineBottom:setAlpha( 0.3 )
	DpadBoxLineBottom:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_line" ) )
	DpadBoxLineBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DpadBoxLineBottom )
	self.DpadBoxLineBottom = DpadBoxLineBottom
	
	local DpadBoxLineTop = LUI.UIImage.new()
	DpadBoxLineTop:setLeftRight( true, true, 10.5, -56 )
	DpadBoxLineTop:setTopBottom( true, true, 42.65, -66.59 )
	DpadBoxLineTop:setAlpha( 0.3 )
	DpadBoxLineTop:setImage( RegisterImage( "uie_t7_freerun_hud_infobarright_line" ) )
	DpadBoxLineTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( DpadBoxLineTop )
	self.DpadBoxLineTop = DpadBoxLineTop
	
	local SideElement2 = LUI.UIImage.new()
	SideElement2:setLeftRight( true, false, -14.08, 21.92 )
	SideElement2:setTopBottom( false, false, -13.72, -10 )
	SideElement2:setZRot( 180 )
	SideElement2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	SideElement2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( SideElement2 )
	self.SideElement2 = SideElement2
	
	local SideElement1 = LUI.UIImage.new()
	SideElement1:setLeftRight( true, false, -14.08, 21.92 )
	SideElement1:setTopBottom( false, false, 49.09, 52.81 )
	SideElement1:setZRot( 180 )
	SideElement1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	SideElement1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( SideElement1 )
	self.SideElement1 = SideElement1
	
	local RestartTrackButtonPrompt = CoD.buttonprompt_small.new( menu, controller )
	RestartTrackButtonPrompt:setLeftRight( true, false, 28, 242 )
	RestartTrackButtonPrompt:setTopBottom( true, false, 49.38, 80.38 )
	RestartTrackButtonPrompt.label:setText( Engine.Localize( "MENU_FR_RESTART_COURSE" ) )
	RestartTrackButtonPrompt:subscribeToGlobalModel( controller, "Controller", "dpad_up_button_image", function ( model )
		local dpadUpButtonImage = Engine.GetModelValue( model )
		if dpadUpButtonImage then
			RestartTrackButtonPrompt.buttonPromptImage:setImage( RegisterImage( dpadUpButtonImage ) )
		end
	end )
	self:addElement( RestartTrackButtonPrompt )
	self.RestartTrackButtonPrompt = RestartTrackButtonPrompt
	
	local RespawnButtonPrompt = CoD.buttonprompt_small.new( menu, controller )
	RespawnButtonPrompt:setLeftRight( true, false, 28, 271 )
	RespawnButtonPrompt:setTopBottom( true, false, 81.24, 112.24 )
	RespawnButtonPrompt.label:setText( Engine.Localize( "MENU_FR_RESPAWN_AT_CHECKPOINT" ) )
	RespawnButtonPrompt:subscribeToGlobalModel( controller, "Controller", "dpad_down_button_image", function ( model )
		local dpadDownButtonImage = Engine.GetModelValue( model )
		if dpadDownButtonImage then
			RespawnButtonPrompt.buttonPromptImage:setImage( RegisterImage( dpadDownButtonImage ) )
		end
	end )
	self:addElement( RespawnButtonPrompt )
	self.RespawnButtonPrompt = RespawnButtonPrompt
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 217.92, 253.92 )
	Image1:setTopBottom( false, false, -13.72, -10 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 217.92, 253.92 )
	Image2:setTopBottom( false, false, 50.09, 53.81 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local RestartTrackButtonPromptPC = LUI.UIText.new()
	RestartTrackButtonPromptPC:setLeftRight( true, false, 28, 350 )
	RestartTrackButtonPromptPC:setTopBottom( true, false, 88.57, 104.57 )
	RestartTrackButtonPromptPC:setAlpha( 0 )
	RestartTrackButtonPromptPC:setText( Engine.Localize( "PLATFORM_FR_RESPAWN_AT_CHECKPOINT" ) )
	RestartTrackButtonPromptPC:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	RestartTrackButtonPromptPC:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RestartTrackButtonPromptPC:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RestartTrackButtonPromptPC )
	self.RestartTrackButtonPromptPC = RestartTrackButtonPromptPC
	
	local RespawnButtonPromptPC = LUI.UIText.new()
	RespawnButtonPromptPC:setLeftRight( true, false, 28, 350 )
	RespawnButtonPromptPC:setTopBottom( true, false, 56.57, 72.57 )
	RespawnButtonPromptPC:setAlpha( 0 )
	RespawnButtonPromptPC:setText( Engine.Localize( "PLATFORM_FR_RESTART_COURSE" ) )
	RespawnButtonPromptPC:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	RespawnButtonPromptPC:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RespawnButtonPromptPC:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RespawnButtonPromptPC )
	self.RespawnButtonPromptPC = RespawnButtonPromptPC
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				RestartTrackButtonPrompt:completeAnimation()
				self.RestartTrackButtonPrompt:setAlpha( 1 )
				self.clipFinished( RestartTrackButtonPrompt, {} )

				RespawnButtonPrompt:completeAnimation()
				self.RespawnButtonPrompt:setAlpha( 1 )
				self.clipFinished( RespawnButtonPrompt, {} )

				RestartTrackButtonPromptPC:completeAnimation()
				self.RestartTrackButtonPromptPC:setAlpha( 0 )
				self.clipFinished( RestartTrackButtonPromptPC, {} )

				RespawnButtonPromptPC:completeAnimation()
				self.RespawnButtonPromptPC:setAlpha( 0 )
				self.clipFinished( RespawnButtonPromptPC, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 9 )

				local f6_local0 = function ( f7_arg0, f7_arg1 )
					if not f7_arg1.interrupted then
						f7_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f7_arg0:setLeftRight( true, false, 0, 287 )
					f7_arg0:setTopBottom( true, false, 0.76, 120.76 )
					f7_arg0:setAlpha( 1 )
					if f7_arg1.interrupted then
						self.clipFinished( f7_arg0, f7_arg1 )
					else
						f7_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				freerunDpadBoxBlur:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				freerunDpadBoxBlur:setLeftRight( true, false, 0, 287 )
				freerunDpadBoxBlur:setTopBottom( true, false, 0.76, 120.76 )
				freerunDpadBoxBlur:setAlpha( 0 )
				freerunDpadBoxBlur:registerEventHandler( "transition_complete_keyframe", f6_local0 )
				local f6_local1 = function ( f8_arg0, f8_arg1 )
					if not f8_arg1.interrupted then
						f8_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					f8_arg0:setAlpha( 0.3 )
					if f8_arg1.interrupted then
						self.clipFinished( f8_arg0, f8_arg1 )
					else
						f8_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ChangeCourseBox:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
				ChangeCourseBox:setAlpha( 0 )
				ChangeCourseBox:registerEventHandler( "transition_complete_keyframe", f6_local1 )
				local ChangeTrackButtonPromptFrame2 = function ( ChangeTrackButtonPrompt, event )
					local ChangeTrackButtonPromptFrame3 = function ( ChangeTrackButtonPrompt, event )
						if not event.interrupted then
							ChangeTrackButtonPrompt:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						ChangeTrackButtonPrompt:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ChangeTrackButtonPrompt, event )
						else
							ChangeTrackButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ChangeTrackButtonPromptFrame3( ChangeTrackButtonPrompt, event )
						return 
					else
						ChangeTrackButtonPrompt:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						ChangeTrackButtonPrompt:registerEventHandler( "transition_complete_keyframe", ChangeTrackButtonPromptFrame3 )
					end
				end
				
				ChangeTrackButtonPrompt:completeAnimation()
				self.ChangeTrackButtonPrompt:setAlpha( 0 )
				ChangeTrackButtonPromptFrame2( ChangeTrackButtonPrompt, {} )
				local DpadBoxLineBottomFrame2 = function ( DpadBoxLineBottom, event )
					local DpadBoxLineBottomFrame3 = function ( DpadBoxLineBottom, event )
						if not event.interrupted then
							DpadBoxLineBottom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						DpadBoxLineBottom:setLeftRight( true, true, 10.5, -60 )
						DpadBoxLineBottom:setTopBottom( true, true, 109, -0.24 )
						DpadBoxLineBottom:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( DpadBoxLineBottom, event )
						else
							DpadBoxLineBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DpadBoxLineBottomFrame3( DpadBoxLineBottom, event )
						return 
					else
						DpadBoxLineBottom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						DpadBoxLineBottom:setAlpha( 0.3 )
						DpadBoxLineBottom:registerEventHandler( "transition_complete_keyframe", DpadBoxLineBottomFrame3 )
					end
				end
				
				DpadBoxLineBottom:completeAnimation()
				self.DpadBoxLineBottom:setLeftRight( true, true, 10.5, -60 )
				self.DpadBoxLineBottom:setTopBottom( true, true, 109, -0.24 )
				self.DpadBoxLineBottom:setAlpha( 0 )
				DpadBoxLineBottomFrame2( DpadBoxLineBottom, {} )
				local DpadBoxLineTopFrame2 = function ( DpadBoxLineTop, event )
					local DpadBoxLineTopFrame3 = function ( DpadBoxLineTop, event )
						if not event.interrupted then
							DpadBoxLineTop:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						DpadBoxLineTop:setLeftRight( true, true, 10.5, -60 )
						DpadBoxLineTop:setTopBottom( true, true, 0, -109.24 )
						DpadBoxLineTop:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( DpadBoxLineTop, event )
						else
							DpadBoxLineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DpadBoxLineTopFrame3( DpadBoxLineTop, event )
						return 
					else
						DpadBoxLineTop:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						DpadBoxLineTop:setAlpha( 0.3 )
						DpadBoxLineTop:registerEventHandler( "transition_complete_keyframe", DpadBoxLineTopFrame3 )
					end
				end
				
				DpadBoxLineTop:completeAnimation()
				self.DpadBoxLineTop:setLeftRight( true, true, 10.5, -60 )
				self.DpadBoxLineTop:setTopBottom( true, true, 107.14, -2.1 )
				self.DpadBoxLineTop:setAlpha( 0 )
				DpadBoxLineTopFrame2( DpadBoxLineTop, {} )
				local SideElement2Frame2 = function ( SideElement2, event )
					local SideElement2Frame3 = function ( SideElement2, event )
						if not event.interrupted then
							SideElement2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						SideElement2:setLeftRight( true, false, 214.92, 250.92 )
						SideElement2:setTopBottom( false, false, -55.37, -51.65 )
						SideElement2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( SideElement2, event )
						else
							SideElement2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SideElement2Frame3( SideElement2, event )
						return 
					else
						SideElement2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						SideElement2:setAlpha( 1 )
						SideElement2:registerEventHandler( "transition_complete_keyframe", SideElement2Frame3 )
					end
				end
				
				SideElement2:completeAnimation()
				self.SideElement2:setLeftRight( true, false, 214.92, 250.92 )
				self.SideElement2:setTopBottom( false, false, 51.77, 55.49 )
				self.SideElement2:setAlpha( 0 )
				SideElement2Frame2( SideElement2, {} )
				local SideElement1Frame2 = function ( SideElement1, event )
					local SideElement1Frame3 = function ( SideElement1, event )
						if not event.interrupted then
							SideElement1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						SideElement1:setLeftRight( true, false, 214.92, 250.92 )
						SideElement1:setTopBottom( false, false, 52.52, 56.24 )
						SideElement1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( SideElement1, event )
						else
							SideElement1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SideElement1Frame3( SideElement1, event )
						return 
					else
						SideElement1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						SideElement1:setAlpha( 1 )
						SideElement1:registerEventHandler( "transition_complete_keyframe", SideElement1Frame3 )
					end
				end
				
				SideElement1:completeAnimation()
				self.SideElement1:setLeftRight( true, false, 214.92, 250.92 )
				self.SideElement1:setTopBottom( false, false, 52.52, 56.24 )
				self.SideElement1:setAlpha( 0 )
				SideElement1Frame2( SideElement1, {} )
				local RestartTrackButtonPromptFrame2 = function ( RestartTrackButtonPrompt, event )
					local RestartTrackButtonPromptFrame3 = function ( RestartTrackButtonPrompt, event )
						if not event.interrupted then
							RestartTrackButtonPrompt:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						RestartTrackButtonPrompt:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( RestartTrackButtonPrompt, event )
						else
							RestartTrackButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RestartTrackButtonPromptFrame3( RestartTrackButtonPrompt, event )
						return 
					else
						RestartTrackButtonPrompt:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						RestartTrackButtonPrompt:registerEventHandler( "transition_complete_keyframe", RestartTrackButtonPromptFrame3 )
					end
				end
				
				RestartTrackButtonPrompt:completeAnimation()
				self.RestartTrackButtonPrompt:setAlpha( 0 )
				RestartTrackButtonPromptFrame2( RestartTrackButtonPrompt, {} )
				local RespawnButtonPromptFrame2 = function ( RespawnButtonPrompt, event )
					local RespawnButtonPromptFrame3 = function ( RespawnButtonPrompt, event )
						if not event.interrupted then
							RespawnButtonPrompt:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						end
						RespawnButtonPrompt:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( RespawnButtonPrompt, event )
						else
							RespawnButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RespawnButtonPromptFrame3( RespawnButtonPrompt, event )
						return 
					else
						RespawnButtonPrompt:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						RespawnButtonPrompt:registerEventHandler( "transition_complete_keyframe", RespawnButtonPromptFrame3 )
					end
				end
				
				RespawnButtonPrompt:completeAnimation()
				self.RespawnButtonPrompt:setAlpha( 0 )
				RespawnButtonPromptFrame2( RespawnButtonPrompt, {} )
			end
		},
		Intro = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )

				freerunDpadBoxBlur:completeAnimation()
				self.freerunDpadBoxBlur:setAlpha( 1 )
				self.clipFinished( freerunDpadBoxBlur, {} )

				ChangeCourseBox:completeAnimation()
				self.ChangeCourseBox:setAlpha( 0.3 )
				self.clipFinished( ChangeCourseBox, {} )

				ChangeTrackButtonPrompt:completeAnimation()
				self.ChangeTrackButtonPrompt:setAlpha( 1 )
				self.clipFinished( ChangeTrackButtonPrompt, {} )

				DpadBoxLineBottom:completeAnimation()
				self.DpadBoxLineBottom:setAlpha( 0.3 )
				self.clipFinished( DpadBoxLineBottom, {} )

				DpadBoxLineTop:completeAnimation()
				self.DpadBoxLineTop:setAlpha( 0.3 )
				self.clipFinished( DpadBoxLineTop, {} )

				SideElement2:completeAnimation()
				self.SideElement2:setAlpha( 1 )
				self.clipFinished( SideElement2, {} )

				SideElement1:completeAnimation()
				self.SideElement1:setAlpha( 1 )
				self.clipFinished( SideElement1, {} )

				RestartTrackButtonPrompt:completeAnimation()
				self.RestartTrackButtonPrompt:setAlpha( 1 )
				self.clipFinished( RestartTrackButtonPrompt, {} )

				RespawnButtonPrompt:completeAnimation()
				self.RespawnButtonPrompt:setAlpha( 1 )
				self.clipFinished( RespawnButtonPrompt, {} )

				RestartTrackButtonPromptPC:completeAnimation()
				self.RestartTrackButtonPromptPC:setAlpha( 0 )
				self.clipFinished( RestartTrackButtonPromptPC, {} )

				RespawnButtonPromptPC:completeAnimation()
				self.RespawnButtonPromptPC:setAlpha( 0 )
				self.clipFinished( RespawnButtonPromptPC, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 9 )

				local f24_local0 = function ( f25_arg0, f25_arg1 )
					if not f25_arg1.interrupted then
						f25_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f25_arg0:setLeftRight( true, false, 0, 287 )
					f25_arg0:setTopBottom( true, false, 0.76, 120.76 )
					f25_arg0:setAlpha( 1 )
					if f25_arg1.interrupted then
						self.clipFinished( f25_arg0, f25_arg1 )
					else
						f25_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				freerunDpadBoxBlur:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				freerunDpadBoxBlur:setLeftRight( true, false, 0, 287 )
				freerunDpadBoxBlur:setTopBottom( true, false, 0.76, 120.76 )
				freerunDpadBoxBlur:setAlpha( 0 )
				freerunDpadBoxBlur:registerEventHandler( "transition_complete_keyframe", f24_local0 )
				local f24_local1 = function ( f26_arg0, f26_arg1 )
					if not f26_arg1.interrupted then
						f26_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					f26_arg0:setAlpha( 0.3 )
					if f26_arg1.interrupted then
						self.clipFinished( f26_arg0, f26_arg1 )
					else
						f26_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ChangeCourseBox:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
				ChangeCourseBox:setAlpha( 0 )
				ChangeCourseBox:registerEventHandler( "transition_complete_keyframe", f24_local1 )
				local ChangeTrackButtonPromptFrame2 = function ( ChangeTrackButtonPrompt, event )
					local ChangeTrackButtonPromptFrame3 = function ( ChangeTrackButtonPrompt, event )
						if not event.interrupted then
							ChangeTrackButtonPrompt:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						ChangeTrackButtonPrompt:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ChangeTrackButtonPrompt, event )
						else
							ChangeTrackButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ChangeTrackButtonPromptFrame3( ChangeTrackButtonPrompt, event )
						return 
					else
						ChangeTrackButtonPrompt:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						ChangeTrackButtonPrompt:registerEventHandler( "transition_complete_keyframe", ChangeTrackButtonPromptFrame3 )
					end
				end
				
				ChangeTrackButtonPrompt:completeAnimation()
				self.ChangeTrackButtonPrompt:setAlpha( 0 )
				ChangeTrackButtonPromptFrame2( ChangeTrackButtonPrompt, {} )
				local DpadBoxLineBottomFrame2 = function ( DpadBoxLineBottom, event )
					local DpadBoxLineBottomFrame3 = function ( DpadBoxLineBottom, event )
						if not event.interrupted then
							DpadBoxLineBottom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						DpadBoxLineBottom:setLeftRight( true, true, 10.5, -60 )
						DpadBoxLineBottom:setTopBottom( true, true, 109, -0.24 )
						DpadBoxLineBottom:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( DpadBoxLineBottom, event )
						else
							DpadBoxLineBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DpadBoxLineBottomFrame3( DpadBoxLineBottom, event )
						return 
					else
						DpadBoxLineBottom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						DpadBoxLineBottom:setAlpha( 0.3 )
						DpadBoxLineBottom:registerEventHandler( "transition_complete_keyframe", DpadBoxLineBottomFrame3 )
					end
				end
				
				DpadBoxLineBottom:completeAnimation()
				self.DpadBoxLineBottom:setLeftRight( true, true, 10.5, -60 )
				self.DpadBoxLineBottom:setTopBottom( true, true, 109, -0.24 )
				self.DpadBoxLineBottom:setAlpha( 0 )
				DpadBoxLineBottomFrame2( DpadBoxLineBottom, {} )
				local DpadBoxLineTopFrame2 = function ( DpadBoxLineTop, event )
					local DpadBoxLineTopFrame3 = function ( DpadBoxLineTop, event )
						if not event.interrupted then
							DpadBoxLineTop:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						DpadBoxLineTop:setLeftRight( true, true, 10.5, -60 )
						DpadBoxLineTop:setTopBottom( true, true, 0, -109.24 )
						DpadBoxLineTop:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( DpadBoxLineTop, event )
						else
							DpadBoxLineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DpadBoxLineTopFrame3( DpadBoxLineTop, event )
						return 
					else
						DpadBoxLineTop:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						DpadBoxLineTop:setAlpha( 0.3 )
						DpadBoxLineTop:registerEventHandler( "transition_complete_keyframe", DpadBoxLineTopFrame3 )
					end
				end
				
				DpadBoxLineTop:completeAnimation()
				self.DpadBoxLineTop:setLeftRight( true, true, 10.5, -60 )
				self.DpadBoxLineTop:setTopBottom( true, true, 107.14, -2.1 )
				self.DpadBoxLineTop:setAlpha( 0 )
				DpadBoxLineTopFrame2( DpadBoxLineTop, {} )
				local SideElement2Frame2 = function ( SideElement2, event )
					local SideElement2Frame3 = function ( SideElement2, event )
						if not event.interrupted then
							SideElement2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						SideElement2:setLeftRight( true, false, 214.92, 250.92 )
						SideElement2:setTopBottom( false, false, -55.37, -51.65 )
						SideElement2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( SideElement2, event )
						else
							SideElement2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SideElement2Frame3( SideElement2, event )
						return 
					else
						SideElement2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						SideElement2:setAlpha( 1 )
						SideElement2:registerEventHandler( "transition_complete_keyframe", SideElement2Frame3 )
					end
				end
				
				SideElement2:completeAnimation()
				self.SideElement2:setLeftRight( true, false, 214.92, 250.92 )
				self.SideElement2:setTopBottom( false, false, 51.77, 55.49 )
				self.SideElement2:setAlpha( 0 )
				SideElement2Frame2( SideElement2, {} )
				local SideElement1Frame2 = function ( SideElement1, event )
					local SideElement1Frame3 = function ( SideElement1, event )
						if not event.interrupted then
							SideElement1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						SideElement1:setLeftRight( true, false, 214.92, 250.92 )
						SideElement1:setTopBottom( false, false, 52.52, 56.24 )
						SideElement1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( SideElement1, event )
						else
							SideElement1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SideElement1Frame3( SideElement1, event )
						return 
					else
						SideElement1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						SideElement1:setAlpha( 1 )
						SideElement1:registerEventHandler( "transition_complete_keyframe", SideElement1Frame3 )
					end
				end
				
				SideElement1:completeAnimation()
				self.SideElement1:setLeftRight( true, false, 214.92, 250.92 )
				self.SideElement1:setTopBottom( false, false, 52.52, 56.24 )
				self.SideElement1:setAlpha( 0 )
				SideElement1Frame2( SideElement1, {} )
				local RestartTrackButtonPromptFrame2 = function ( RestartTrackButtonPrompt, event )
					local RestartTrackButtonPromptFrame3 = function ( RestartTrackButtonPrompt, event )
						if not event.interrupted then
							RestartTrackButtonPrompt:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						RestartTrackButtonPrompt:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( RestartTrackButtonPrompt, event )
						else
							RestartTrackButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RestartTrackButtonPromptFrame3( RestartTrackButtonPrompt, event )
						return 
					else
						RestartTrackButtonPrompt:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						RestartTrackButtonPrompt:registerEventHandler( "transition_complete_keyframe", RestartTrackButtonPromptFrame3 )
					end
				end
				
				RestartTrackButtonPrompt:completeAnimation()
				self.RestartTrackButtonPrompt:setAlpha( 0 )
				RestartTrackButtonPromptFrame2( RestartTrackButtonPrompt, {} )
				local RespawnButtonPromptFrame2 = function ( RespawnButtonPrompt, event )
					local RespawnButtonPromptFrame3 = function ( RespawnButtonPrompt, event )
						if not event.interrupted then
							RespawnButtonPrompt:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						end
						RespawnButtonPrompt:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( RespawnButtonPrompt, event )
						else
							RespawnButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RespawnButtonPromptFrame3( RespawnButtonPrompt, event )
						return 
					else
						RespawnButtonPrompt:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						RespawnButtonPrompt:registerEventHandler( "transition_complete_keyframe", RespawnButtonPromptFrame3 )
					end
				end
				
				RespawnButtonPrompt:completeAnimation()
				self.RespawnButtonPrompt:setAlpha( 0 )
				RespawnButtonPromptFrame2( RespawnButtonPrompt, {} )
			end
		},
		DefaultState_PC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				RestartTrackButtonPrompt:completeAnimation()
				self.RestartTrackButtonPrompt:setAlpha( 0 )
				self.clipFinished( RestartTrackButtonPrompt, {} )

				RespawnButtonPrompt:completeAnimation()
				self.RespawnButtonPrompt:setAlpha( 0 )
				self.clipFinished( RespawnButtonPrompt, {} )

				RestartTrackButtonPromptPC:completeAnimation()
				self.RestartTrackButtonPromptPC:setAlpha( 1 )
				self.clipFinished( RestartTrackButtonPromptPC, {} )

				RespawnButtonPromptPC:completeAnimation()
				self.RespawnButtonPromptPC:setAlpha( 1 )
				self.clipFinished( RespawnButtonPromptPC, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 9 )

				local f42_local0 = function ( f43_arg0, f43_arg1 )
					if not f43_arg1.interrupted then
						f43_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					f43_arg0:setLeftRight( true, false, 0, 287 )
					f43_arg0:setTopBottom( true, false, 0.76, 120.76 )
					f43_arg0:setAlpha( 1 )
					if f43_arg1.interrupted then
						self.clipFinished( f43_arg0, f43_arg1 )
					else
						f43_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				freerunDpadBoxBlur:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				freerunDpadBoxBlur:setLeftRight( true, false, 0, 287 )
				freerunDpadBoxBlur:setTopBottom( true, false, 0.76, 120.76 )
				freerunDpadBoxBlur:setAlpha( 0 )
				freerunDpadBoxBlur:registerEventHandler( "transition_complete_keyframe", f42_local0 )
				local f42_local1 = function ( f44_arg0, f44_arg1 )
					if not f44_arg1.interrupted then
						f44_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					f44_arg0:setAlpha( 0.3 )
					if f44_arg1.interrupted then
						self.clipFinished( f44_arg0, f44_arg1 )
					else
						f44_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ChangeCourseBox:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
				ChangeCourseBox:setAlpha( 0 )
				ChangeCourseBox:registerEventHandler( "transition_complete_keyframe", f42_local1 )
				local ChangeTrackButtonPromptFrame2 = function ( ChangeTrackButtonPrompt, event )
					local ChangeTrackButtonPromptFrame3 = function ( ChangeTrackButtonPrompt, event )
						if not event.interrupted then
							ChangeTrackButtonPrompt:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						end
						ChangeTrackButtonPrompt:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( ChangeTrackButtonPrompt, event )
						else
							ChangeTrackButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ChangeTrackButtonPromptFrame3( ChangeTrackButtonPrompt, event )
						return 
					else
						ChangeTrackButtonPrompt:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						ChangeTrackButtonPrompt:registerEventHandler( "transition_complete_keyframe", ChangeTrackButtonPromptFrame3 )
					end
				end
				
				ChangeTrackButtonPrompt:completeAnimation()
				self.ChangeTrackButtonPrompt:setAlpha( 0 )
				ChangeTrackButtonPromptFrame2( ChangeTrackButtonPrompt, {} )
				local DpadBoxLineBottomFrame2 = function ( DpadBoxLineBottom, event )
					local DpadBoxLineBottomFrame3 = function ( DpadBoxLineBottom, event )
						if not event.interrupted then
							DpadBoxLineBottom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						DpadBoxLineBottom:setLeftRight( true, true, 10.5, -60 )
						DpadBoxLineBottom:setTopBottom( true, true, 109, -0.24 )
						DpadBoxLineBottom:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( DpadBoxLineBottom, event )
						else
							DpadBoxLineBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DpadBoxLineBottomFrame3( DpadBoxLineBottom, event )
						return 
					else
						DpadBoxLineBottom:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						DpadBoxLineBottom:setAlpha( 0.3 )
						DpadBoxLineBottom:registerEventHandler( "transition_complete_keyframe", DpadBoxLineBottomFrame3 )
					end
				end
				
				DpadBoxLineBottom:completeAnimation()
				self.DpadBoxLineBottom:setLeftRight( true, true, 10.5, -60 )
				self.DpadBoxLineBottom:setTopBottom( true, true, 109, -0.24 )
				self.DpadBoxLineBottom:setAlpha( 0 )
				DpadBoxLineBottomFrame2( DpadBoxLineBottom, {} )
				local DpadBoxLineTopFrame2 = function ( DpadBoxLineTop, event )
					local DpadBoxLineTopFrame3 = function ( DpadBoxLineTop, event )
						if not event.interrupted then
							DpadBoxLineTop:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						DpadBoxLineTop:setLeftRight( true, true, 10.5, -60 )
						DpadBoxLineTop:setTopBottom( true, true, 0, -109.24 )
						DpadBoxLineTop:setAlpha( 0.3 )
						if event.interrupted then
							self.clipFinished( DpadBoxLineTop, event )
						else
							DpadBoxLineTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DpadBoxLineTopFrame3( DpadBoxLineTop, event )
						return 
					else
						DpadBoxLineTop:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						DpadBoxLineTop:setAlpha( 0.3 )
						DpadBoxLineTop:registerEventHandler( "transition_complete_keyframe", DpadBoxLineTopFrame3 )
					end
				end
				
				DpadBoxLineTop:completeAnimation()
				self.DpadBoxLineTop:setLeftRight( true, true, 10.5, -60 )
				self.DpadBoxLineTop:setTopBottom( true, true, 107.14, -2.1 )
				self.DpadBoxLineTop:setAlpha( 0 )
				DpadBoxLineTopFrame2( DpadBoxLineTop, {} )
				local SideElement2Frame2 = function ( SideElement2, event )
					local SideElement2Frame3 = function ( SideElement2, event )
						if not event.interrupted then
							SideElement2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						SideElement2:setLeftRight( true, false, 214.92, 250.92 )
						SideElement2:setTopBottom( false, false, -55.37, -51.65 )
						SideElement2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( SideElement2, event )
						else
							SideElement2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SideElement2Frame3( SideElement2, event )
						return 
					else
						SideElement2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						SideElement2:setAlpha( 1 )
						SideElement2:registerEventHandler( "transition_complete_keyframe", SideElement2Frame3 )
					end
				end
				
				SideElement2:completeAnimation()
				self.SideElement2:setLeftRight( true, false, 214.92, 250.92 )
				self.SideElement2:setTopBottom( false, false, 51.77, 55.49 )
				self.SideElement2:setAlpha( 0 )
				SideElement2Frame2( SideElement2, {} )
				local SideElement1Frame2 = function ( SideElement1, event )
					local SideElement1Frame3 = function ( SideElement1, event )
						if not event.interrupted then
							SideElement1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						SideElement1:setLeftRight( true, false, 214.92, 250.92 )
						SideElement1:setTopBottom( false, false, 52.52, 56.24 )
						SideElement1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( SideElement1, event )
						else
							SideElement1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SideElement1Frame3( SideElement1, event )
						return 
					else
						SideElement1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						SideElement1:setAlpha( 1 )
						SideElement1:registerEventHandler( "transition_complete_keyframe", SideElement1Frame3 )
					end
				end
				
				SideElement1:completeAnimation()
				self.SideElement1:setLeftRight( true, false, 214.92, 250.92 )
				self.SideElement1:setTopBottom( false, false, 52.52, 56.24 )
				self.SideElement1:setAlpha( 0 )
				SideElement1Frame2( SideElement1, {} )
				local RestartTrackButtonPromptFrame2 = function ( RestartTrackButtonPrompt, event )
					local RestartTrackButtonPromptFrame3 = function ( RestartTrackButtonPrompt, event )
						if not event.interrupted then
							RestartTrackButtonPrompt:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
						end
						RestartTrackButtonPrompt:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( RestartTrackButtonPrompt, event )
						else
							RestartTrackButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RestartTrackButtonPromptFrame3( RestartTrackButtonPrompt, event )
						return 
					else
						RestartTrackButtonPrompt:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						RestartTrackButtonPrompt:registerEventHandler( "transition_complete_keyframe", RestartTrackButtonPromptFrame3 )
					end
				end
				
				RestartTrackButtonPrompt:completeAnimation()
				self.RestartTrackButtonPrompt:setAlpha( 0 )
				RestartTrackButtonPromptFrame2( RestartTrackButtonPrompt, {} )
				local RespawnButtonPromptFrame2 = function ( RespawnButtonPrompt, event )
					local RespawnButtonPromptFrame3 = function ( RespawnButtonPrompt, event )
						if not event.interrupted then
							RespawnButtonPrompt:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						end
						RespawnButtonPrompt:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( RespawnButtonPrompt, event )
						else
							RespawnButtonPrompt:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RespawnButtonPromptFrame3( RespawnButtonPrompt, event )
						return 
					else
						RespawnButtonPrompt:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						RespawnButtonPrompt:registerEventHandler( "transition_complete_keyframe", RespawnButtonPromptFrame3 )
					end
				end
				
				RespawnButtonPrompt:completeAnimation()
				self.RespawnButtonPrompt:setAlpha( 0 )
				RespawnButtonPromptFrame2( RespawnButtonPrompt, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Intro",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "DefaultState_PC",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f1_local16 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local16( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.freerunDpadBoxBlur:close()
		element.ChangeTrackButtonPrompt:close()
		element.RestartTrackButtonPrompt:close()
		element.RespawnButtonPrompt:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

