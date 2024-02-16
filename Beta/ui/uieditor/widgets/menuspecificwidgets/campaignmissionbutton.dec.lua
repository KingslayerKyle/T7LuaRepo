CoD.CampaignMissionButton = InheritFrom( LUI.UIElement )
CoD.CampaignMissionButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CampaignMissionButton )
	self.id = "CampaignMissionButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 27 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local levelName = LUI.UITightText.new()
	levelName:setLeftRight( true, false, 0, 100 )
	levelName:setTopBottom( false, false, -12.5, 12.5 )
	levelName:setTTF( "fonts/default.ttf" )
	self:addElement( levelName )
	self.levelName = levelName
	
	self.levelName:linkToElementModel( self, "locName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			levelName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				levelName:completeAnimation()
				self.levelName:setLeftRight( true, false, 0, 99 )
				self.levelName:setTopBottom( false, false, -12.5, 12.5 )
				self.levelName:setRGB( 1, 1, 1 )
				self.levelName:setZoom( 10 )
				self.clipFinished( levelName, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				local levelNameFrame2 = function ( levelName, event )
					local levelNameFrame3 = function ( levelName, event )
						local levelNameFrame4 = function ( levelName, event )
							if not event.interrupted then
								levelName:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							end
							levelName:setLeftRight( true, false, 0, 99 )
							levelName:setTopBottom( false, false, -12.5, 12.5 )
							levelName:setRGB( 1, 0.64, 0 )
							levelName:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( levelName, event )
							else
								levelName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							levelNameFrame4( levelName, event )
							return 
						else
							levelName:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
							levelName:setRGB( 0.71, 0.59, 0.37 )
							levelName:registerEventHandler( "transition_complete_keyframe", levelNameFrame4 )
						end
					end
					
					if event.interrupted then
						levelNameFrame3( levelName, event )
						return 
					else
						levelName:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						levelName:setRGB( 0.94, 0.63, 0.07 )
						levelName:registerEventHandler( "transition_complete_keyframe", levelNameFrame3 )
					end
				end
				
				levelName:completeAnimation()
				self.levelName:setLeftRight( true, false, 0, 99 )
				self.levelName:setTopBottom( false, false, -12.5, 12.5 )
				self.levelName:setRGB( 1, 0.64, 0 )
				self.levelName:setZoom( 0 )
				levelNameFrame2( levelName, {} )
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 1 )
				local levelNameFrame2 = function ( levelName, event )
					if not event.interrupted then
						levelName:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					levelName:setLeftRight( true, false, 0, 109 )
					levelName:setTopBottom( false, false, -12.5, 12.5 )
					levelName:setZoom( 10 )
					if event.interrupted then
						self.clipFinished( levelName, event )
					else
						levelName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				levelName:completeAnimation()
				self.levelName:setLeftRight( true, false, -10, 99 )
				self.levelName:setTopBottom( false, false, -12.5, 12.5 )
				self.levelName:setZoom( 10 )
				levelNameFrame2( levelName, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.levelName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

