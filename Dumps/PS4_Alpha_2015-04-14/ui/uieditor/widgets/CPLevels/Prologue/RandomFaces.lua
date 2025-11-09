local RandomHeadshots = function ( self, event )
	if self.maxHeadshotCount < self.headshotCount then
		self.headshotCount = 1
	end
	self.faces:setImage( self.headshots[self.headshotCount] )
	self.headshotCount = self.headshotCount + math.random( 1, 8 )
end

local UpdateTextForScan = function ( self, event )
	if self.maxHeadshotCount < self.updateTextCount then
		self.updateTextCount = 1
	end
	local headshotMod = self.updateTextCount % 4
	if headshotMod == 0 then
		self.TextBox0:setText( Engine.Localize( "MENU_SCANNING_CAPS" ) )
	elseif headshotMod == 1 then
		self.TextBox0:setText( Engine.Localize( "MENU_SCANNING_CAPS" ) .. "." )
	elseif headshotMod == 2 then
		self.TextBox0:setText( Engine.Localize( "MENU_SCANNING_CAPS" ) .. ".." )
	elseif headshotMod == 3 then
		self.TextBox0:setText( Engine.Localize( "MENU_SCANNING_CAPS" ) .. "..." )
	end
	self.updateTextCount = self.updateTextCount + 1
end

local ScanStart = function ( self, event )
	self:setState( "DefaultState" )
	self.headshotCount = math.random( 1, 8 )
	RandomHeadshots( self, event )
	self.headshotTimer = LUI.UITimer.new( math.random( 250, 500 ), {
		name = "random_headshots"
	}, false, self )
	self:addElement( self.headshotTimer )
	self.updateTextCount = math.random( 1, 8 )
	self.textUpdateTimer = LUI.UITimer.new( math.random( 250, 500 ), {
		name = "update_text_for_scan"
	}, false, self )
	self:addElement( self.textUpdateTimer )
end

local ScanReset = function ( self, event )
	if self.headshotTimer then
		self.headshotTimer:close()
	end
	if self.textUpdateTimer then
		self.textUpdateTimer:close()
	end
end

local MatchFound = function ( self, event )
	ScanReset( self, event )
	self.faces:setImage( self.foundHeadshot )
	self:setState( "MatchFound" )
end

local MatchNotFound = function ( self, event )
	ScanReset( self, event )
	self:setState( "MatchNotFound" )
end

local PostLoadFunc = function ( self, controller )
	self.maxHeadshotCount = 8
	self.headshots = {}
	for i = 1, self.maxHeadshotCount, 1 do
		local image = "hud_head0" .. i
		self.headshots[i] = RegisterMaterial( image )
	end
	self.foundHeadshot = RegisterMaterial( "hud_head_minister" )
	self:registerEventHandler( "random_headshots", RandomHeadshots )
	self:registerEventHandler( "update_text_for_scan", UpdateTextForScan )
	self:registerEventHandler( "scan_start", ScanStart )
	self:registerEventHandler( "scan_reset", ScanReset )
	self:registerEventHandler( "match_found", MatchFound )
	self:registerEventHandler( "match_not_found", MatchNotFound )
end

CoD.RandomFaces = InheritFrom( LUI.UIElement )
CoD.RandomFaces.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.RandomFaces )
	self.id = "RandomFaces"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 63 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setRGB( 0, 0, 0 )
	bg:setAlpha( 0.25 )
	bg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bg )
	self.bg = bg
	
	local faces = LUI.UIImage.new()
	faces:setLeftRight( true, false, 0, 62.5 )
	faces:setTopBottom( false, false, -31.25, 31.25 )
	faces:setRGB( 1, 1, 1 )
	faces:setImage( RegisterImage( "uie_hud_pak_head01" ) )
	faces:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( faces )
	self.faces = faces
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( false, true, -137.5, 0 )
	TextBox0:setTopBottom( true, false, 7.25, 23.25 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setText( Engine.Localize( "MENU_SCANNING_CAPS" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( false, true, -137.5, 0 )
	TextBox1:setTopBottom( true, false, 23.25, 39.25 )
	TextBox1:setRGB( 1, 1, 1 )
	TextBox1:setText( Engine.Localize( "ANALYZING" ) )
	TextBox1:setTTF( "fonts/default.ttf" )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( false, true, -137.5, 0 )
	TextBox2:setTopBottom( true, false, 39.25, 55.25 )
	TextBox2:setRGB( 1, 1, 1 )
	TextBox2:setText( Engine.Localize( "..." ) )
	TextBox2:setTTF( "fonts/default.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				bg:completeAnimation()
				self.bg:setAlpha( 0.25 )
				self.clipFinished( bg, {} )
				faces:completeAnimation()
				self.faces:setAlpha( 1 )
				self.clipFinished( faces, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.TextBox0:setText( Engine.Localize( "MENU_SCANNING_CAPS" ) )
				self.clipFinished( TextBox0, {} )
				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 1 )
				self.TextBox1:setText( Engine.Localize( "ANALYZING" ) )
				self.clipFinished( TextBox1, {} )
				TextBox2:completeAnimation()
				self.TextBox2:setAlpha( 1 )
				self.TextBox2:setText( Engine.Localize( "..." ) )
				self.clipFinished( TextBox2, {} )
			end,
			MatchFound = function ()
				self:setupElementClipCounter( 5 )
				bg:completeAnimation()
				self.bg:setAlpha( 0.25 )
				self.clipFinished( bg, {} )
				faces:completeAnimation()
				self.faces:setAlpha( 1 )
				self.clipFinished( faces, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
				local TextBox1Frame2 = function ( TextBox1, event )
					local TextBox1Frame3 = function ( TextBox1, event )
						local TextBox1Frame4 = function ( TextBox1, event )
							local TextBox1Frame5 = function ( TextBox1, event )
								local TextBox1Frame6 = function ( TextBox1, event )
									if not event.interrupted then
										TextBox1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
									end
									TextBox1:setAlpha( 0 )
									TextBox1:setText( Engine.Localize( "MENU_MATCH_FOUND_CAPS" ) )
									if event.interrupted then
										self.clipFinished( TextBox1, event )
									else
										TextBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									TextBox1Frame6( TextBox1, event )
									return 
								else
									TextBox1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
									TextBox1:setAlpha( 1 )
									TextBox1:registerEventHandler( "transition_complete_keyframe", TextBox1Frame6 )
								end
							end
							
							if event.interrupted then
								TextBox1Frame5( TextBox1, event )
								return 
							else
								TextBox1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								TextBox1:setAlpha( 0.25 )
								TextBox1:registerEventHandler( "transition_complete_keyframe", TextBox1Frame5 )
							end
						end
						
						if event.interrupted then
							TextBox1Frame4( TextBox1, event )
							return 
						else
							TextBox1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							TextBox1:setAlpha( 1 )
							TextBox1:registerEventHandler( "transition_complete_keyframe", TextBox1Frame4 )
						end
					end
					
					if event.interrupted then
						TextBox1Frame3( TextBox1, event )
						return 
					else
						TextBox1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						TextBox1:setAlpha( 0.25 )
						TextBox1:registerEventHandler( "transition_complete_keyframe", TextBox1Frame3 )
					end
				end
				
				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 1 )
				self.TextBox1:setText( Engine.Localize( "MENU_MATCH_FOUND_CAPS" ) )
				TextBox1Frame2( TextBox1, {} )
				TextBox2:completeAnimation()
				self.TextBox2:setAlpha( 0 )
				self.clipFinished( TextBox2, {} )
			end,
			MatchNotFound = function ()
				self:setupElementClipCounter( 5 )
				bg:completeAnimation()
				self.bg:setAlpha( 0.25 )
				self.clipFinished( bg, {} )
				faces:completeAnimation()
				self.faces:setAlpha( 1 )
				self.clipFinished( faces, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
				local TextBox1Frame2 = function ( TextBox1, event )
					local TextBox1Frame3 = function ( TextBox1, event )
						local TextBox1Frame4 = function ( TextBox1, event )
							local TextBox1Frame5 = function ( TextBox1, event )
								local TextBox1Frame6 = function ( TextBox1, event )
									if not event.interrupted then
										TextBox1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
									end
									TextBox1:setAlpha( 0 )
									TextBox1:setText( Engine.Localize( "MENU_MATCH_NOT_FOUND_CAPS" ) )
									if event.interrupted then
										self.clipFinished( TextBox1, event )
									else
										TextBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									TextBox1Frame6( TextBox1, event )
									return 
								else
									TextBox1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
									TextBox1:setAlpha( 1 )
									TextBox1:registerEventHandler( "transition_complete_keyframe", TextBox1Frame6 )
								end
							end
							
							if event.interrupted then
								TextBox1Frame5( TextBox1, event )
								return 
							else
								TextBox1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
								TextBox1:setAlpha( 0.25 )
								TextBox1:registerEventHandler( "transition_complete_keyframe", TextBox1Frame5 )
							end
						end
						
						if event.interrupted then
							TextBox1Frame4( TextBox1, event )
							return 
						else
							TextBox1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							TextBox1:setAlpha( 1 )
							TextBox1:registerEventHandler( "transition_complete_keyframe", TextBox1Frame4 )
						end
					end
					
					if event.interrupted then
						TextBox1Frame3( TextBox1, event )
						return 
					else
						TextBox1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						TextBox1:setAlpha( 0.25 )
						TextBox1:registerEventHandler( "transition_complete_keyframe", TextBox1Frame3 )
					end
				end
				
				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 1 )
				self.TextBox1:setText( Engine.Localize( "MENU_MATCH_NOT_FOUND_CAPS" ) )
				TextBox1Frame2( TextBox1, {} )
				TextBox2:completeAnimation()
				self.TextBox2:setAlpha( 0 )
				self.clipFinished( TextBox2, {} )
			end
		},
		MatchFound = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				faces:completeAnimation()
				self.faces:setAlpha( 0 )
				self.clipFinished( faces, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 0 )
				self.clipFinished( TextBox1, {} )
				TextBox2:completeAnimation()
				self.TextBox2:setAlpha( 0 )
				self.clipFinished( TextBox2, {} )
			end
		},
		MatchNotFound = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				faces:completeAnimation()
				self.faces:setAlpha( 0 )
				self.clipFinished( faces, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 0 )
				self.clipFinished( TextBox1, {} )
				TextBox2:completeAnimation()
				self.TextBox2:setAlpha( 0 )
				self.clipFinished( TextBox2, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

