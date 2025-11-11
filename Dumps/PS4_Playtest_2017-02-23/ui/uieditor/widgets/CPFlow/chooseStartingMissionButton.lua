CoD.chooseStartingMissionButton = InheritFrom( LUI.UIElement )
CoD.chooseStartingMissionButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseStartingMissionButton )
	self.id = "chooseStartingMissionButton"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 500 )
	self:setTopBottom( 0, 0, 0, 283 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 500 )
	BG:setTopBottom( 0, 0, 0, 283 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.5 )
	self:addElement( BG )
	self.BG = BG
	
	local mapImage = LUI.UIImage.new()
	mapImage:setLeftRight( 0, 1, 0, 0 )
	mapImage:setTopBottom( 0, 1, 0, 0 )
	mapImage:setAlpha( 0.5 )
	mapImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			mapImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( mapImage )
	self.mapImage = mapImage
	
	local textBacking = LUI.UIImage.new()
	textBacking:setLeftRight( 0, 1, 0, 0 )
	textBacking:setTopBottom( 1, 1, -40, 0 )
	textBacking:setRGB( 0, 0, 0 )
	textBacking:setAlpha( 0.7 )
	self:addElement( textBacking )
	self.textBacking = textBacking
	
	local mapName = LUI.UITightText.new()
	mapName:setLeftRight( 0, 0, 3, 203 )
	mapName:setTopBottom( 0, 0, 248, 278 )
	mapName:setTTF( "fonts/default.ttf" )
	mapName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			mapName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( mapName )
	self.mapName = mapName
	
	local Ember = LUI.UIImage.new()
	Ember:setLeftRight( 0, 1, 0, 0 )
	Ember:setTopBottom( 0, 1, 0, 0 )
	Ember:setAlpha( 0 )
	Ember:setImage( RegisterImage( "uie_cp_genderselection_ember" ) )
	self:addElement( Ember )
	self.Ember = Ember
	
	local BG22 = LUI.UIImage.new()
	BG22:setLeftRight( 0, 0, 0, 500 )
	BG22:setTopBottom( 0, 0, 0, 4 )
	BG22:setRGB( 0.33, 0.95, 0.71 )
	BG22:setAlpha( 0.4 )
	self:addElement( BG22 )
	self.BG22 = BG22
	
	self.resetProperties = function ()
		mapImage:completeAnimation()
		textBacking:completeAnimation()
		mapName:completeAnimation()
		BG:completeAnimation()
		BG22:completeAnimation()
		Ember:completeAnimation()
		mapImage:setAlpha( 0.5 )
		mapImage:setScale( 1 )
		textBacking:setLeftRight( 0, 1, 0, 0 )
		textBacking:setTopBottom( 1, 1, -40, 0 )
		textBacking:setScale( 1 )
		mapName:setLeftRight( 0, 0, 3, 203 )
		mapName:setTopBottom( 0, 0, 248, 278 )
		BG:setAlpha( 0.5 )
		BG:setScale( 1 )
		BG22:setLeftRight( 0, 0, 0, 500 )
		BG22:setTopBottom( 0, 0, 0, 4 )
		BG22:setAlpha( 0.4 )
		Ember:setAlpha( 0 )
		Ember:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BG:completeAnimation()
				self.BG:setScale( 0.9 )
				self.clipFinished( BG, {} )
				mapImage:completeAnimation()
				self.mapImage:setScale( 0.9 )
				self.clipFinished( mapImage, {} )
				textBacking:completeAnimation()
				self.textBacking:setLeftRight( 0, 1, 0, 0 )
				self.textBacking:setTopBottom( 1, 1, -52, -12 )
				self.textBacking:setScale( 0.9 )
				self.clipFinished( textBacking, {} )
				mapName:completeAnimation()
				self.mapName:setLeftRight( 0, 0, 30, 230 )
				self.mapName:setTopBottom( 0, 0, 236, 266 )
				self.clipFinished( mapName, {} )
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 25, 475 )
				self.BG22:setTopBottom( 0, 0, 14, 18 )
				self.BG22:setAlpha( 0 )
				self.clipFinished( BG22, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local BGFrame2 = function ( BG, event )
					if not event.interrupted then
						BG:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					BG:setAlpha( 0.5 )
					BG:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BG, event )
					else
						BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:completeAnimation()
				self.BG:setAlpha( 0.5 )
				self.BG:setScale( 0.9 )
				BGFrame2( BG, {} )
				local mapImageFrame2 = function ( mapImage, event )
					if not event.interrupted then
						mapImage:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					mapImage:setAlpha( 1 )
					mapImage:setScale( 1 )
					if event.interrupted then
						self.clipFinished( mapImage, event )
					else
						mapImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				mapImage:completeAnimation()
				self.mapImage:setAlpha( 0.5 )
				self.mapImage:setScale( 0.9 )
				mapImageFrame2( mapImage, {} )
				local textBackingFrame2 = function ( textBacking, event )
					if not event.interrupted then
						textBacking:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					textBacking:setLeftRight( 0, 1, 0, 0 )
					textBacking:setTopBottom( 1, 1, -40, 0 )
					textBacking:setScale( 1 )
					if event.interrupted then
						self.clipFinished( textBacking, event )
					else
						textBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				textBacking:completeAnimation()
				self.textBacking:setLeftRight( 0, 1, 0, 0 )
				self.textBacking:setTopBottom( 1, 1, -52, -12 )
				self.textBacking:setScale( 0.9 )
				textBackingFrame2( textBacking, {} )
				local mapNameFrame2 = function ( mapName, event )
					if not event.interrupted then
						mapName:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					mapName:setLeftRight( 0, 0, 3, 203 )
					mapName:setTopBottom( 0, 0, 248, 278 )
					if event.interrupted then
						self.clipFinished( mapName, event )
					else
						mapName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				mapName:completeAnimation()
				self.mapName:setLeftRight( 0, 0, 30, 230 )
				self.mapName:setTopBottom( 0, 0, 236, 266 )
				mapNameFrame2( mapName, {} )
				local EmberFrame2 = function ( Ember, event )
					if not event.interrupted then
						Ember:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					Ember:setAlpha( 1 )
					Ember:setScale( 1 )
					if event.interrupted then
						self.clipFinished( Ember, event )
					else
						Ember:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Ember:completeAnimation()
				self.Ember:setAlpha( 0 )
				self.Ember:setScale( 0.9 )
				EmberFrame2( Ember, {} )
				local BG22Frame2 = function ( BG22, event )
					if not event.interrupted then
						BG22:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					BG22:setLeftRight( 0, 0, 0, 500 )
					BG22:setTopBottom( 0, 0, 0, 4 )
					BG22:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( BG22, event )
					else
						BG22:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 25, 475 )
				self.BG22:setTopBottom( 0, 0, 14, 18 )
				self.BG22:setAlpha( 0 )
				BG22Frame2( BG22, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				mapImage:completeAnimation()
				self.mapImage:setAlpha( 1 )
				self.clipFinished( mapImage, {} )
				Ember:completeAnimation()
				self.Ember:setAlpha( 1 )
				self.clipFinished( Ember, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local BGFrame2 = function ( BG, event )
					if not event.interrupted then
						BG:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					BG:setAlpha( 0.5 )
					BG:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( BG, event )
					else
						BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:completeAnimation()
				self.BG:setAlpha( 0.5 )
				self.BG:setScale( 1 )
				BGFrame2( BG, {} )
				local mapImageFrame2 = function ( mapImage, event )
					if not event.interrupted then
						mapImage:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					mapImage:setAlpha( 0.5 )
					mapImage:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( mapImage, event )
					else
						mapImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				mapImage:completeAnimation()
				self.mapImage:setAlpha( 1 )
				self.mapImage:setScale( 1 )
				mapImageFrame2( mapImage, {} )
				local textBackingFrame2 = function ( textBacking, event )
					if not event.interrupted then
						textBacking:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					textBacking:setLeftRight( 0, 1, 0, 0 )
					textBacking:setTopBottom( 1, 1, -52, -12 )
					textBacking:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( textBacking, event )
					else
						textBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				textBacking:completeAnimation()
				self.textBacking:setLeftRight( 0, 1, 0, 0 )
				self.textBacking:setTopBottom( 1, 1, -40, 0 )
				self.textBacking:setScale( 1 )
				textBackingFrame2( textBacking, {} )
				local mapNameFrame2 = function ( mapName, event )
					if not event.interrupted then
						mapName:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					mapName:setLeftRight( 0, 0, 30, 230 )
					mapName:setTopBottom( 0, 0, 236, 266 )
					if event.interrupted then
						self.clipFinished( mapName, event )
					else
						mapName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				mapName:completeAnimation()
				self.mapName:setLeftRight( 0, 0, 3, 203 )
				self.mapName:setTopBottom( 0, 0, 248, 278 )
				mapNameFrame2( mapName, {} )
				local EmberFrame2 = function ( Ember, event )
					if not event.interrupted then
						Ember:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					Ember:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Ember, event )
					else
						Ember:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Ember:completeAnimation()
				self.Ember:setAlpha( 1 )
				EmberFrame2( Ember, {} )
				local BG22Frame2 = function ( BG22, event )
					if not event.interrupted then
						BG22:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					BG22:setLeftRight( 0, 0, 25, 475 )
					BG22:setTopBottom( 0, 0, 14, 18 )
					BG22:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BG22, event )
					else
						BG22:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 0, 500 )
				self.BG22:setTopBottom( 0, 0, 0, 4 )
				self.BG22:setAlpha( 0.4 )
				BG22Frame2( BG22, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.mapImage:close()
		self.mapName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

