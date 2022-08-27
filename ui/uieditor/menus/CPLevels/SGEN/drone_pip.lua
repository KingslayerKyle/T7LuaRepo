-- 5e612bd619b554e61784014c5b0f9f50
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0 )
	local f1_local0 = f1_arg0.close
	f1_arg0.close = function ( f2_arg0 )
		f2_arg0:playClip( "Close" )
		f2_arg0:registerEventHandler( "clip_over", f1_local0 )
	end
	
end

LUI.createMenu.drone_pip = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "drone_pip" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "drone_pip.buttonPrompts" )
	local f3_local1 = self
	
	local pip = LUI.UIImage.new()
	pip:setLeftRight( true, false, 90.5, 448.5 )
	pip:setTopBottom( true, false, 62, 248 )
	pip:setMaterial( LUI.UIImage.GetCachedMaterial( "extracam_1" ) )
	pip:setShaderVector( 0, 0, 0, 1, 1 )
	pip:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( pip )
	self.pip = pip
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, false, 90.5, 448.5 )
	black:setTopBottom( true, false, 62, 248 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0 )
	self:addElement( black )
	self.black = black
	
	local noise = LUI.UIImage.new()
	noise:setLeftRight( true, false, 90.5, 448.5 )
	noise:setTopBottom( true, false, 62, 248 )
	noise:setRGB( 0, 0, 0 )
	noise:setAlpha( 0 )
	noise:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_digital_noise" ) )
	noise:setShaderVector( 0, 0.7, 0, 0, 0 )
	noise:setShaderVector( 1, 1, 0, 0, 0 )
	self:addElement( noise )
	self.noise = noise
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				noise:completeAnimation()
				self.noise:setAlpha( 0 )
				self.clipFinished( noise, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 2 )
				local blackFrame2 = function ( black, event )
					local blackFrame3 = function ( black, event )
						if not event.interrupted then
							black:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						end
						black:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( black, event )
						else
							black:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						blackFrame3( black, event )
						return 
					else
						black:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						black:registerEventHandler( "transition_complete_keyframe", blackFrame3 )
					end
				end
				
				black:completeAnimation()
				self.black:setAlpha( 0 )
				blackFrame2( black, {} )
				local noiseFrame2 = function ( noise, event )
					local noiseFrame3 = function ( noise, event )
						if not event.interrupted then
							noise:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						noise:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( noise, event )
						else
							noise:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						noiseFrame3( noise, event )
						return 
					else
						noise:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						noise:setAlpha( 1 )
						noise:registerEventHandler( "transition_complete_keyframe", noiseFrame3 )
					end
				end
				
				noise:completeAnimation()
				self.noise:setAlpha( 0 )
				noiseFrame2( noise, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "drone_pip.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

