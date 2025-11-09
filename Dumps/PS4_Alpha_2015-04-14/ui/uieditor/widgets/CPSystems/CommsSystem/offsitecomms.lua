CoD.OffsiteComms = InheritFrom( LUI.UIElement )
CoD.OffsiteComms.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OffsiteComms )
	self.id = "OffsiteComms"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 80 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setRGB( 1, 1, 1 )
	bg:setAlpha( 0.5 )
	bg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bg )
	self.bg = bg
	
	local headshot = LUI.UIImage.new()
	headshot:setLeftRight( true, false, 4.55, 75.55 )
	headshot:setTopBottom( true, false, 4.5, 75.5 )
	headshot:setRGB( 1, 1, 1 )
	headshot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( headshot )
	self.headshot = headshot
	
	local waveform = LUI.UIImage.new()
	waveform:setLeftRight( true, false, 83.98, 234.98 )
	waveform:setTopBottom( true, false, 30, 75.5 )
	waveform:setRGB( 1, 1, 1 )
	waveform:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( waveform )
	self.waveform = waveform
	
	local signal = LUI.UIImage.new()
	signal:setLeftRight( true, false, 242, 393 )
	signal:setTopBottom( true, false, 30, 75.5 )
	signal:setRGB( 1, 1, 1 )
	signal:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( signal )
	self.signal = signal
	
	local characterName = LUI.UITightText.new()
	characterName:setLeftRight( true, false, 83.98, 226.98 )
	characterName:setTopBottom( true, false, 4.5, 24.5 )
	characterName:setRGB( 1, 1, 1 )
	characterName:setText( Engine.Localize( "LAST NAME, FIRST" ) )
	characterName:setTTF( "fonts/default.ttf" )
	self:addElement( characterName )
	self.characterName = characterName
	
	local typeName = LUI.UIText.new()
	typeName:setLeftRight( true, false, 242, 393 )
	typeName:setTopBottom( true, false, 4.5, 24.5 )
	typeName:setRGB( 1, 1, 1 )
	typeName:setText( Engine.Localize( "DNI-DIRECT" ) )
	typeName:setTTF( "fonts/default.ttf" )
	typeName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	typeName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( typeName )
	self.typeName = typeName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				bg:completeAnimation()
				self.bg:setLeftRight( true, true, 0, 0 )
				self.bg:setTopBottom( true, true, 0, 0 )
				self.clipFinished( bg, {} )
				headshot:completeAnimation()
				self.headshot:setLeftRight( true, false, 4.55, 75.55 )
				self.headshot:setTopBottom( true, false, 4.5, 75.5 )
				self.headshot:setAlpha( 0 )
				self.clipFinished( headshot, {} )
				waveform:completeAnimation()
				self.waveform:setLeftRight( true, false, 83.98, 234.98 )
				self.waveform:setTopBottom( true, false, 30, 75.5 )
				self.waveform:setAlpha( 0 )
				self.clipFinished( waveform, {} )
				signal:completeAnimation()
				self.signal:setLeftRight( true, false, 242, 393 )
				self.signal:setTopBottom( true, false, 30, 75.5 )
				self.signal:setAlpha( 0 )
				self.clipFinished( signal, {} )
				characterName:completeAnimation()
				self.characterName:setLeftRight( true, false, 83.98, 226.98 )
				self.characterName:setTopBottom( true, false, 4.5, 24.5 )
				self.characterName:setAlpha( 0 )
				self.clipFinished( characterName, {} )
				typeName:completeAnimation()
				self.typeName:setLeftRight( true, false, 242, 393 )
				self.typeName:setTopBottom( true, false, 4.5, 24.5 )
				self.typeName:setAlpha( 0 )
				self.clipFinished( typeName, {} )
			end,
			Add = function ()
				self:setupElementClipCounter( 6 )
				local bgFrame2 = function ( bg, event )
					if not event.interrupted then
						bg:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					bg:setLeftRight( true, true, 0, 0 )
					bg:setTopBottom( true, true, 0, 0 )
					bg:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( bg, event )
					else
						bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bg:completeAnimation()
				self.bg:setLeftRight( true, true, 0, 0 )
				self.bg:setTopBottom( true, true, 0, 0 )
				self.bg:setAlpha( 0 )
				bgFrame2( bg, {} )
				local headshotFrame2 = function ( headshot, event )
					if not event.interrupted then
						headshot:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					headshot:setLeftRight( true, false, 4.55, 75.55 )
					headshot:setTopBottom( true, false, 4.5, 75.5 )
					headshot:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( headshot, event )
					else
						headshot:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				headshot:completeAnimation()
				self.headshot:setLeftRight( true, false, 4.55, 75.55 )
				self.headshot:setTopBottom( true, false, 4.5, 75.5 )
				self.headshot:setAlpha( 0 )
				headshotFrame2( headshot, {} )
				local waveformFrame2 = function ( waveform, event )
					if not event.interrupted then
						waveform:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					waveform:setLeftRight( true, false, 83.98, 234.98 )
					waveform:setTopBottom( true, false, 30, 75.5 )
					waveform:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( waveform, event )
					else
						waveform:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				waveform:completeAnimation()
				self.waveform:setLeftRight( true, false, 83.98, 234.98 )
				self.waveform:setTopBottom( true, false, 30, 75.5 )
				self.waveform:setAlpha( 0 )
				waveformFrame2( waveform, {} )
				local signalFrame2 = function ( signal, event )
					if not event.interrupted then
						signal:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					signal:setLeftRight( true, false, 242, 393 )
					signal:setTopBottom( true, false, 30, 75.5 )
					signal:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( signal, event )
					else
						signal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				signal:completeAnimation()
				self.signal:setLeftRight( true, false, 242, 393 )
				self.signal:setTopBottom( true, false, 30, 75.5 )
				self.signal:setAlpha( 0 )
				signalFrame2( signal, {} )
				local characterNameFrame2 = function ( characterName, event )
					if not event.interrupted then
						characterName:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					characterName:setLeftRight( true, false, 83.98, 226.98 )
					characterName:setTopBottom( true, false, 4.5, 24.5 )
					characterName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( characterName, event )
					else
						characterName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				characterName:completeAnimation()
				self.characterName:setLeftRight( true, false, 83.98, 226.98 )
				self.characterName:setTopBottom( true, false, 4.5, 24.5 )
				self.characterName:setAlpha( 0 )
				characterNameFrame2( characterName, {} )
				local typeNameFrame2 = function ( typeName, event )
					if not event.interrupted then
						typeName:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					typeName:setLeftRight( true, false, 242, 393 )
					typeName:setTopBottom( true, false, 4.5, 24.5 )
					typeName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( typeName, event )
					else
						typeName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				typeName:completeAnimation()
				self.typeName:setLeftRight( true, false, 242, 393 )
				self.typeName:setTopBottom( true, false, 4.5, 24.5 )
				self.typeName:setAlpha( 0 )
				typeNameFrame2( typeName, {} )
			end,
			Down = function ()
				self:setupElementClipCounter( 6 )
				local bgFrame2 = function ( bg, event )
					local bgFrame3 = function ( bg, event )
						if not event.interrupted then
							bg:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
						end
						bg:setLeftRight( true, true, 0, 0 )
						bg:setTopBottom( true, true, 0, 0 )
						bg:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( bg, event )
						else
							bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						bgFrame3( bg, event )
						return 
					else
						bg:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						bg:setTopBottom( true, true, -79.2, -79.2 )
						bg:setAlpha( 0.5 )
						bg:registerEventHandler( "transition_complete_keyframe", bgFrame3 )
					end
				end
				
				bg:completeAnimation()
				self.bg:setLeftRight( true, true, 0, 0 )
				self.bg:setTopBottom( true, true, -80, -80 )
				self.bg:setAlpha( 0 )
				bgFrame2( bg, {} )
				local headshotFrame2 = function ( headshot, event )
					local headshotFrame3 = function ( headshot, event )
						if not event.interrupted then
							headshot:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
						end
						headshot:setLeftRight( true, false, 4.55, 75.55 )
						headshot:setTopBottom( true, false, 4.5, 75.5 )
						headshot:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( headshot, event )
						else
							headshot:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						headshotFrame3( headshot, event )
						return 
					else
						headshot:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						headshot:setTopBottom( true, false, -74.7, -3.7 )
						headshot:setAlpha( 1 )
						headshot:registerEventHandler( "transition_complete_keyframe", headshotFrame3 )
					end
				end
				
				headshot:completeAnimation()
				self.headshot:setLeftRight( true, false, 4.55, 75.55 )
				self.headshot:setTopBottom( true, false, -75.5, -4.5 )
				self.headshot:setAlpha( 0 )
				headshotFrame2( headshot, {} )
				local waveformFrame2 = function ( waveform, event )
					local waveformFrame3 = function ( waveform, event )
						if not event.interrupted then
							waveform:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
						end
						waveform:setLeftRight( true, false, 83.98, 234.98 )
						waveform:setTopBottom( true, false, 30, 75.5 )
						waveform:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( waveform, event )
						else
							waveform:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						waveformFrame3( waveform, event )
						return 
					else
						waveform:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						waveform:setTopBottom( true, false, -49.2, -3.7 )
						waveform:setAlpha( 1 )
						waveform:registerEventHandler( "transition_complete_keyframe", waveformFrame3 )
					end
				end
				
				waveform:completeAnimation()
				self.waveform:setLeftRight( true, false, 83.98, 234.98 )
				self.waveform:setTopBottom( true, false, -50, -4.5 )
				self.waveform:setAlpha( 0 )
				waveformFrame2( waveform, {} )
				local signalFrame2 = function ( signal, event )
					local signalFrame3 = function ( signal, event )
						if not event.interrupted then
							signal:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
						end
						signal:setLeftRight( true, false, 242, 393 )
						signal:setTopBottom( true, false, 30, 75.5 )
						signal:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( signal, event )
						else
							signal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						signalFrame3( signal, event )
						return 
					else
						signal:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						signal:setTopBottom( true, false, -49.2, -3.7 )
						signal:setAlpha( 1 )
						signal:registerEventHandler( "transition_complete_keyframe", signalFrame3 )
					end
				end
				
				signal:completeAnimation()
				self.signal:setLeftRight( true, false, 242, 393 )
				self.signal:setTopBottom( true, false, -50, -4.5 )
				self.signal:setAlpha( 0 )
				signalFrame2( signal, {} )
				local characterNameFrame2 = function ( characterName, event )
					local characterNameFrame3 = function ( characterName, event )
						if not event.interrupted then
							characterName:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
						end
						characterName:setLeftRight( true, false, 83.98, 226.98 )
						characterName:setTopBottom( true, false, 4.5, 24.5 )
						characterName:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( characterName, event )
						else
							characterName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						characterNameFrame3( characterName, event )
						return 
					else
						characterName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						characterName:setTopBottom( true, false, -74.7, -54.7 )
						characterName:setAlpha( 1 )
						characterName:registerEventHandler( "transition_complete_keyframe", characterNameFrame3 )
					end
				end
				
				characterName:completeAnimation()
				self.characterName:setLeftRight( true, false, 83.98, 226.98 )
				self.characterName:setTopBottom( true, false, -75.5, -55.5 )
				self.characterName:setAlpha( 0 )
				characterNameFrame2( characterName, {} )
				local typeNameFrame2 = function ( typeName, event )
					local typeNameFrame3 = function ( typeName, event )
						if not event.interrupted then
							typeName:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
						end
						typeName:setLeftRight( true, false, 242, 393 )
						typeName:setTopBottom( true, false, 4.5, 24.5 )
						typeName:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( typeName, event )
						else
							typeName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						typeNameFrame3( typeName, event )
						return 
					else
						typeName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						typeName:setTopBottom( true, false, -74.7, -54.7 )
						typeName:setAlpha( 1 )
						typeName:registerEventHandler( "transition_complete_keyframe", typeNameFrame3 )
					end
				end
				
				typeName:completeAnimation()
				self.typeName:setLeftRight( true, false, 242, 393 )
				self.typeName:setTopBottom( true, false, -75.5, -55.5 )
				self.typeName:setAlpha( 0 )
				typeNameFrame2( typeName, {} )
			end,
			Off = function ()
				self:setupElementClipCounter( 6 )
				local bgFrame2 = function ( bg, event )
					if not event.interrupted then
						bg:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					bg:setLeftRight( true, true, 400, 400 )
					bg:setTopBottom( true, true, 0, 0 )
					bg:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( bg, event )
					else
						bg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bg:completeAnimation()
				self.bg:setLeftRight( true, true, 0, 0 )
				self.bg:setTopBottom( true, true, 0, 0 )
				self.bg:setAlpha( 0.5 )
				bgFrame2( bg, {} )
				local headshotFrame2 = function ( headshot, event )
					if not event.interrupted then
						headshot:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					headshot:setLeftRight( true, false, 404.55, 475.55 )
					headshot:setTopBottom( true, false, 4.5, 75.5 )
					headshot:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( headshot, event )
					else
						headshot:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				headshot:completeAnimation()
				self.headshot:setLeftRight( true, false, 4.55, 75.55 )
				self.headshot:setTopBottom( true, false, 4.5, 75.5 )
				self.headshot:setAlpha( 1 )
				headshotFrame2( headshot, {} )
				local waveformFrame2 = function ( waveform, event )
					if not event.interrupted then
						waveform:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					waveform:setLeftRight( true, false, 483.98, 634.98 )
					waveform:setTopBottom( true, false, 30, 75.5 )
					waveform:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( waveform, event )
					else
						waveform:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				waveform:completeAnimation()
				self.waveform:setLeftRight( true, false, 83.98, 234.98 )
				self.waveform:setTopBottom( true, false, 30, 75.5 )
				self.waveform:setAlpha( 1 )
				waveformFrame2( waveform, {} )
				local signalFrame2 = function ( signal, event )
					if not event.interrupted then
						signal:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					signal:setLeftRight( true, false, 642, 793 )
					signal:setTopBottom( true, false, 30, 75.5 )
					signal:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( signal, event )
					else
						signal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				signal:completeAnimation()
				self.signal:setLeftRight( true, false, 242, 393 )
				self.signal:setTopBottom( true, false, 30, 75.5 )
				self.signal:setAlpha( 1 )
				signalFrame2( signal, {} )
				local characterNameFrame2 = function ( characterName, event )
					if not event.interrupted then
						characterName:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					characterName:setLeftRight( true, false, 483.98, 626.98 )
					characterName:setTopBottom( true, false, 4.5, 24.5 )
					characterName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( characterName, event )
					else
						characterName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				characterName:completeAnimation()
				self.characterName:setLeftRight( true, false, 83.98, 226.98 )
				self.characterName:setTopBottom( true, false, 4.5, 24.5 )
				self.characterName:setAlpha( 1 )
				characterNameFrame2( characterName, {} )
				local typeNameFrame2 = function ( typeName, event )
					if not event.interrupted then
						typeName:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					typeName:setLeftRight( true, false, 642, 793 )
					typeName:setTopBottom( true, false, 4.5, 24.5 )
					typeName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( typeName, event )
					else
						typeName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				typeName:completeAnimation()
				self.typeName:setLeftRight( true, false, 242, 393 )
				self.typeName:setTopBottom( true, false, 4.5, 24.5 )
				self.typeName:setAlpha( 1 )
				typeNameFrame2( typeName, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

