CoD.KillcamWidgetNumbers = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetNumbers.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetNumbers )
	self.id = "KillcamWidgetNumbers"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 240 )
	self:setTopBottom( 0, 0, 0, 105 )
	
	local Numbers = LUI.UIText.new()
	Numbers:setLeftRight( 0.5, 0.5, -120, 120 )
	Numbers:setTopBottom( 0, 1, 0, 0 )
	Numbers:setRGB( 0.59, 0.64, 0.74 )
	Numbers:setText( Engine.Localize( "XX" ) )
	Numbers:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Numbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Numbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Numbers )
	self.Numbers = Numbers
	
	self.resetProperties = function ()
		Numbers:completeAnimation()
		Numbers:setRGB( 0.59, 0.64, 0.74 )
		Numbers:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Start = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local NumbersFrame2 = function ( Numbers, event )
					if not event.interrupted then
						Numbers:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
					end
					Numbers:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Numbers, event )
					else
						Numbers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Numbers:completeAnimation()
				self.Numbers:setAlpha( 0 )
				NumbersFrame2( Numbers, {} )
			end
		},
		WinTime = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Numbers:completeAnimation()
				self.Numbers:setRGB( 0.05, 1, 0 )
				self.Numbers:setAlpha( 0.7 )
				self.clipFinished( Numbers, {} )
			end
		},
		LossTime = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Numbers:completeAnimation()
				self.Numbers:setRGB( 1, 0.01, 0 )
				self.Numbers:setAlpha( 0.7 )
				self.clipFinished( Numbers, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

