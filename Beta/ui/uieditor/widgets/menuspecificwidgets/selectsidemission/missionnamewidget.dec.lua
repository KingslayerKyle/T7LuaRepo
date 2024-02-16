require( "ui.uieditor.widgets.Border" )

CoD.missionNameWidget = InheritFrom( LUI.UIElement )
CoD.missionNameWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.missionNameWidget )
	self.id = "missionNameWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 65 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.02, 0.02, 0.02 )
	background:setAlpha( 0.4 )
	self:addElement( background )
	self.background = background
	
	local selectionBorder = CoD.Border.new( menu, controller )
	selectionBorder:setLeftRight( true, true, 0, 0 )
	selectionBorder:setTopBottom( true, true, 0, 0 )
	selectionBorder:setRGB( 1, 0.64, 0 )
	selectionBorder:setAlpha( 0 )
	self:addElement( selectionBorder )
	self.selectionBorder = selectionBorder
	
	local missionName = LUI.UIText.new()
	missionName:setLeftRight( true, true, 5, -5 )
	missionName:setTopBottom( true, true, 5, -5 )
	missionName:setTTF( "fonts/default.ttf" )
	missionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	missionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( missionName )
	self.missionName = missionName
	
	self.missionName:linkToElementModel( self, "missionName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			missionName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				selectionBorder:completeAnimation()
				self.selectionBorder:setAlpha( 0 )
				self.clipFinished( selectionBorder, {} )
				missionName:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				missionName:setLeftRight( true, true, 5, -5 )
				missionName:setTopBottom( true, true, 5, -5 )
				missionName:setRGB( 1, 1, 1 )
				missionName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				selectionBorder:completeAnimation()
				self.selectionBorder:setAlpha( 1 )
				self.clipFinished( selectionBorder, {} )
				missionName:completeAnimation()
				self.missionName:setRGB( 1, 0.64, 0 )
				self.clipFinished( missionName, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )
				local selectionBorderFrame2 = function ( selectionBorder, event )
					if not event.interrupted then
						selectionBorder:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					selectionBorder:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( selectionBorder, event )
					else
						selectionBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionBorder:completeAnimation()
				self.selectionBorder:setAlpha( 0.7 )
				selectionBorderFrame2( selectionBorder, {} )
				local missionNameFrame2 = function ( missionName, event )
					local missionNameFrame3 = function ( missionName, event )
						if not event.interrupted then
							missionName:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						end
						missionName:setLeftRight( true, true, 5, -5 )
						missionName:setTopBottom( true, true, 5, -5 )
						missionName:setRGB( 1, 0.64, 0 )
						if event.interrupted then
							self.clipFinished( missionName, event )
						else
							missionName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						missionNameFrame3( missionName, event )
						return 
					else
						missionName:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						missionName:setLeftRight( true, true, 10, -5 )
						missionName:setRGB( 1, 0.82, 0.5 )
						missionName:registerEventHandler( "transition_complete_keyframe", missionNameFrame3 )
					end
				end
				
				missionName:completeAnimation()
				self.missionName:setLeftRight( true, true, 5, -5 )
				self.missionName:setTopBottom( true, true, 5, -5 )
				self.missionName:setRGB( 1, 1, 1 )
				missionNameFrame2( missionName, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 2 )
				local selectionBorderFrame2 = function ( selectionBorder, event )
					if not event.interrupted then
						selectionBorder:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					selectionBorder:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( selectionBorder, event )
					else
						selectionBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionBorder:completeAnimation()
				self.selectionBorder:setAlpha( 1 )
				selectionBorderFrame2( selectionBorder, {} )
				local missionNameFrame2 = function ( missionName, event )
					if not event.interrupted then
						missionName:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					missionName:setRGB( 1, 1, 1 )
					if event.interrupted then
						self.clipFinished( missionName, event )
					else
						missionName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				missionName:completeAnimation()
				self.missionName:setRGB( 1, 0.64, 0 )
				missionNameFrame2( missionName, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.selectionBorder:close()
		self.missionName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

