require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )

local PostLoadFunc = function ( self )
	self.playNotification = function ( self, event )
		self.Title.MatchText:setText( event.title )
		self.Description:setText( event.description )
		self:playClip( "ShowNotification" )
	end
	
	self.appendNotification = function ( self, event )
		if self.notificationInProgress == true then
			local finalNotification = self.nextNotification
			if finalNotification == nil then
				self.nextNotification = LUI.ShallowCopy( event )
			end
			while finalNotification and finalNotification.next ~= nil do
				finalNotification = finalNotification.next
			end
			finalNotification.next = LUI.ShallowCopy( event )
		else
			self:playNotification( LUI.ShallowCopy( event ) )
		end
	end
	
	self.notificationInProgress = false
	self.nextNotification = nil
	LUI.OverrideFunction_CallOriginalSecond( self, "playClip", function ( self )
		self.notificationInProgress = true
	end )
	self:registerEventHandler( "clip_over", function ( element, event )
		self.notificationInProgress = false
		if self.nextNotification ~= nil then
			self:playNotification( self.nextNotification )
			self.nextNotification = self.nextNotification.next
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
	Description:setTopBottom( false, false, 14, 34 )
	Description:setRGB( 1, 1, 1 )
	Description:setText( Engine.Localize( "MENU_NEW" ) )
	Description:setTTF( "fonts/Entovo.ttf" )
	Description:setLetterSpacing( 0.5 )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local Title = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	Title:setLeftRight( false, false, -142, 142 )
	Title:setTopBottom( false, false, -28, 8 )
	Title:setRGB( 1, 1, 1 )
	Title.FEButtonPanel0:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	Title.FEButtonPanel0:setAlpha( 0.8 )
	Title.FEButtonPanel0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Title.Glow:setAlpha( 0.44 )
	Title.MatchText:setRGB( 0, 0, 0 )
	Title.MatchText:setAlpha( 1 )
	Title.MatchText:setText( Engine.Localize( "MENU_READY" ) )
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
	self.close = function ( self )
		self.Title:close()
		CoD.ReadyEvents.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

