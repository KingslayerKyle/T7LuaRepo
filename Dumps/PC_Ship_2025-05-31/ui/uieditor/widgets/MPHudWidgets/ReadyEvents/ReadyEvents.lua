require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.playNotification = function ( f2_arg0, f2_arg1 )
		f2_arg0.currentNotification = f2_arg1
		f2_arg0.Title.MatchText:setText( f2_arg1.title )
		f2_arg0.Description:setText( f2_arg1.description )
		f2_arg0:playClip( "ShowNotification" )
	end
	
	local f1_local0 = function ()
		local f3_local0 = Engine.GetModel( DataSources.PerController.getModel( f1_arg1 ), "vehicle.vehicleType" )
		return f3_local0 and Engine.GetModelValue( f3_local0 ) ~= ""
	end
	
	local f1_local1 = function ()
		return IsGameTypeEqualToString( "ball" ) and IsCurrentWeaponReference( f1_arg1, "ball" )
	end
	
	f1_arg0.appendNotification = function ( f5_arg0, f5_arg1 )
		if LUI.DEVHideButtonPrompts then
			return 
		elseif f1_local1() then
			if f5_arg0.secondAttempt then
				f5_arg0.secondAttempt = nil
			else
				f5_arg0.secondAttempt = true
				local self = LUI.UITimer.new( 500, "appendNotificationSecondCheck", true, f5_arg0 )
				f5_arg0:registerEventHandler( "appendNotificationSecondCheck", function ( element, event )
					f5_arg0:appendNotification( f5_arg1 )
				end )
				f5_arg0:addElement( self )
			end
			return 
		end
		local self = function ( f7_arg0 )
			local f7_local0 = LUI.ShallowCopy( f7_arg0 )
			if f5_arg0.nextNotification == nil then
				f5_arg0.nextNotification = f7_local0
			else
				local f7_local1 = nil
				local f7_local2 = f5_arg0.nextNotification
				while f7_local2 and f7_arg0.priority <= f7_local2.priority do
					f7_local1 = f7_local2
					f7_local2 = f7_local2.next
				end
				if f7_local1 then
					f7_local0.next = f7_local1.next
					f7_local1.next = f7_local0
				end
				f5_arg0.nextNotification = f7_local0
				f7_local0.next = f7_local2
			end
		end
		
		if f1_local0() then
			self( f5_arg1 )
		elseif f5_arg0.currentNotification ~= nil then
			local f5_local1 = Engine.milliseconds() - f5_arg0.notificationStartTime
			if f5_local1 > 0 and f5_local1 < 30 and f5_arg0.currentNotification.priority < f5_arg1.priority then
				f5_arg0.nextNotification = f5_arg0.currentNotification
				f5_arg0:playNotification( LUI.ShallowCopy( f5_arg1 ) )
			else
				self( f5_arg1 )
			end
		else
			f5_arg0:playNotification( LUI.ShallowCopy( f5_arg1 ) )
		end
	end
	
	f1_arg0.notificationStartTime = -1
	f1_arg0.currentNotification = nil
	f1_arg0.nextNotification = nil
	LUI.OverrideFunction_CallOriginalSecond( f1_arg0, "playClip", function ( element )
		element.notificationStartTime = Engine.milliseconds()
	end )
	f1_arg0:registerEventHandler( "clip_over", function ( element, event )
		f1_arg0.notificationStartTime = -1
		f1_arg0.currentNotification = nil
		if f1_arg0.nextNotification ~= nil and not f1_local0() then
			f1_arg0:playNotification( f1_arg0.nextNotification )
			f1_arg0.nextNotification = f1_arg0.nextNotification.next
		end
	end )
	f1_arg0:subscribeToGlobalModel( f1_arg1, "PerController", "vehicle.vehicleType", function ( model )
		if Engine.GetModelValue( model ) == "" then
			f1_arg0:processEvent( {
				name = "clip_over"
			} )
		end
	end )
	f1_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "currentWeapon.equippedWeaponReference" ), function ( model )
		if f1_local1() then
			f1_arg0.nextNotification = nil
			f1_arg0:playClip( "DefaultClip" )
			f1_arg0:processEvent( {
				name = "clip_over"
			} )
		end
	end )
end

CoD.ReadyEvents = InheritFrom( LUI.UIElement )
CoD.ReadyEvents.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ReadyEvents )
	self.id = "ReadyEvents"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 120 )
	
	local DarkenBG = LUI.UIImage.new()
	DarkenBG:setLeftRight( true, true, 0, 0 )
	DarkenBG:setTopBottom( true, true, 0, 0 )
	DarkenBG:setRGB( 0, 0, 0 )
	DarkenBG:setAlpha( 0 )
	DarkenBG:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( DarkenBG )
	self.DarkenBG = DarkenBG
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( false, false, -200, 200 )
	Description:setTopBottom( false, false, 8, 28 )
	Description:setText( Engine.Localize( "MENU_NEW" ) )
	Description:setTTF( "fonts/escom.ttf" )
	Description:setLetterSpacing( 0.5 )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local Title = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	Title:setLeftRight( false, false, -142, 142 )
	Title:setTopBottom( false, false, -28, 8 )
	Title.FEButtonPanel0:setRGB( 1, 0.84, 0 )
	Title.FEButtonPanel0:setAlpha( 0.8 )
	Title.FEButtonPanel0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Title.Glow:setAlpha( 0.44 )
	Title.MatchText:setRGB( 0, 0, 0 )
	Title.MatchText:setAlpha( 1 )
	Title.MatchText:setText( Engine.Localize( "MENU_READY" ) )
	Title.MatchText:setTTF( "fonts/escom.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				self.clipFinished( Description, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
			end,
			ShowNotification = function ()
				self:setupElementClipCounter( 2 )
				local DescriptionFrame2 = function ( Description, event )
					local DescriptionFrame3 = function ( Description, event )
						local DescriptionFrame4 = function ( Description, event )
							if not event.interrupted then
								Description:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
							end
							Description:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Description, event )
							else
								Description:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							DescriptionFrame4( Description, event )
							return 
						else
							Description:beginAnimation( "keyframe", 2750, false, false, CoD.TweenType.Linear )
							Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame4 )
						end
					end
					
					if event.interrupted then
						DescriptionFrame3( Description, event )
						return 
					else
						Description:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						Description:setAlpha( 1 )
						Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame3 )
					end
				end
				
				Description:completeAnimation()
				self.Description:setAlpha( 0 )
				DescriptionFrame2( Description, {} )
				local TitleFrame2 = function ( Title, event )
					local TitleFrame3 = function ( Title, event )
						local TitleFrame4 = function ( Title, event )
							if not event.interrupted then
								Title:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Bounce )
							end
							Title:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( Title, event )
							else
								Title:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TitleFrame4( Title, event )
							return 
						else
							Title:beginAnimation( "keyframe", 2529, false, false, CoD.TweenType.Linear )
							Title:registerEventHandler( "transition_complete_keyframe", TitleFrame4 )
						end
					end
					
					if event.interrupted then
						TitleFrame3( Title, event )
						return 
					else
						Title:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Bounce )
						Title:setAlpha( 1 )
						Title:registerEventHandler( "transition_complete_keyframe", TitleFrame3 )
					end
				end
				
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				TitleFrame2( Title, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

