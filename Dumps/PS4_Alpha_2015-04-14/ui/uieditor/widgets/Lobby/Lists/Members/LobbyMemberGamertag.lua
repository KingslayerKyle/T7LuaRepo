CoD.LobbyMemberGamertag = InheritFrom( LUI.UIElement )
CoD.LobbyMemberGamertag.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberGamertag )
	self.id = "LobbyMemberGamertag"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 271 )
	self:setTopBottom( true, false, 0, 25 )
	
	local gamertag = LUI.UITightText.new()
	gamertag:setLeftRight( true, false, 0, 271 )
	gamertag:setTopBottom( true, false, 0, 25 )
	gamertag:setRGB( 0.87, 0.9, 0.9 )
	gamertag:setAlpha( 0.25 )
	gamertag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	gamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gamertag:setText( modelValue )
		end
	end )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
			end,
			TeamSwitch = function ()
				self:setupElementClipCounter( 1 )
				local gamertagFrame2 = function ( gamertag, event )
					local gamertagFrame3 = function ( gamertag, event )
						if not event.interrupted then
							gamertag:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						gamertag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( gamertag, event )
						else
							gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gamertagFrame3( gamertag, event )
						return 
					else
						gamertag:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						gamertag:registerEventHandler( "transition_complete_keyframe", gamertagFrame3 )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 0.25 )
				gamertagFrame2( gamertag, {} )
			end
		},
		IsSelf = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.96, 1, 0.33 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			TeamSwitch = function ()
				self:setupElementClipCounter( 1 )
				local gamertagFrame2 = function ( gamertag, event )
					local gamertagFrame3 = function ( gamertag, event )
						if not event.interrupted then
							gamertag:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						gamertag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( gamertag, event )
						else
							gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gamertagFrame3( gamertag, event )
						return 
					else
						gamertag:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						gamertag:registerEventHandler( "transition_complete_keyframe", gamertagFrame3 )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 0.25 )
				gamertagFrame2( gamertag, {} )
			end
		},
		IsPartyMember = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				gamertag:completeAnimation()
				self.gamertag:setRGB( 0.87, 0.9, 0.9 )
				self.gamertag:setAlpha( 1 )
				self.gamertag:setZoom( 0 )
				self.clipFinished( gamertag, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			TeamSwitch = function ()
				self:setupElementClipCounter( 1 )
				local gamertagFrame2 = function ( gamertag, event )
					local gamertagFrame3 = function ( gamertag, event )
						if not event.interrupted then
							gamertag:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						gamertag:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( gamertag, event )
						else
							gamertag:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gamertagFrame3( gamertag, event )
						return 
					else
						gamertag:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						gamertag:registerEventHandler( "transition_complete_keyframe", gamertagFrame3 )
					end
				end
				
				gamertag:completeAnimation()
				self.gamertag:setAlpha( 0.25 )
				gamertagFrame2( gamertag, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "IsSelf",
			condition = function ( menu, element, event )
				return IsSelfItem( element, controller )
			end
		},
		{
			stateName = "IsPartyMember",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self.close = function ( self )
		self.gamertag:close()
		CoD.LobbyMemberGamertag.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

