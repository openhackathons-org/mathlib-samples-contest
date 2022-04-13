# Math Libraries Sample Contest

This repository will host submissions for contests to extend the set of samples that are provided with the [CUDA Math Libraries](https://github.com/NVIDIA/CUDALibrarySamples) created by the developer community. 

Contestants will be asked to provide a sample application that illustrates some aspects of using the Math Libraries.

## Official Rules
By entering this Contest, you agree to be bound by these Official Rules and to comply with all applicable laws and regulations.

NO PURCHASE OR PAYMENT OF ANY KIND IS NECESSARY TO ENTER THIS CONTEST. THIS CONTEST IS VOID WHERE RESTRICTED OR PROHIBITED BY LAW. OPEN TO LEGAL RESIDENTS OF THE UNITED STATES OF AMERICA (EXCLUDING PUERTO RICO AND ITS OTHER TERRITORIES AND POSSESSIONS) AND POLAND.

### Sponsor
This Contest is sponsored by NVIDIA Corporation, on behalf of itself and its affiliates, with an address at 2788 San Tomas Expressway, Santa Clara, CA 95051, U.S.A. (hereinafter “NVIDIA” or “Sponsor”). 

### Eligibility
You must be a resident of the UNITED STATES OF AMERICA (EXCLUDING PUERTO RICO AND ITS OTHER TERRITORIES AND POSSESSIONS) OR POLAND and eighteen (18) years of age or older to be eligible to participate in this Contest. This Contest is open to individuals only. No team entries and no corporate or institutional entries are permitted in this Contest. Employees of Sponsor, its affiliates, and their respective contractors, service providers and professional advisors connected with this Contest (“Sponsor Related Parties”), as well as members of their immediate families and/or households, are NOT eligible to enter.

### The Challenge
This Contest involves the following challenge: The entrant must write application software (“Content”) whose main function is to illustrate some aspect of using the features of the math and image processing libraries being part of NVIDIA® Math Libraries. Content is for educational purposes and must adhere to the criteria listed below:

1. Content must use at least one of the APIs from the list below: 
    * [cuBLAS](https://docs.nvidia.com/cuda/cublas/index.html)
    * [cuSPARSE](https://docs.nvidia.com/cuda/cusparse/index.html)
    * [cuSOLVER](https://docs.nvidia.com/cuda/cusolver/index.html)
    * [cuRAND](https://docs.nvidia.com/cuda/curand/index.html)
    * [cuFFT](https://docs.nvidia.com/cuda/cufft/index.html)
    * [Math API](https://docs.nvidia.com/cuda/cuda-math-api/index.html)
    * [CUTLASS](https://github.com/NVIDIA/cutlass)
    * [NPP](https://docs.nvidia.com/cuda/npp/index.html)
    * [nvJPEG](https://docs.nvidia.com/cuda/nvjpeg/index.html)
    * [nvJPEG2000](https://docs.nvidia.com/cuda/nvjpeg2000/userguide.html)
    * Math Library Device Extensions
        * [MathDx](https://developer.nvidia.com/mathdx)
    * Multi-Node, Multi-GPU Libraries
        * [cuSOLVERMp](https://docs.nvidia.com/hpc-sdk/cusolvermp/index.html)
        * [cuFFTMp](https://docs.nvidia.com/hpc-sdk/cufftmp/index.html)

2. Content must utilize NVIDIA CUDA® Toolkit 11.x software stack.
3. The code must be formatted using the .clang-format as provided in the community repository 
4. The code must be tested with compute-sanitizer as directed by instructions in the community repository. 
5. The code should be clean, verbose and maintainable and must include inline comments
6. All submitted samples must include the appropriate documentation (README file), including:
    1. compile instructions
    2. APIs used
    3. a description of the Content goal (what does the code do and why)
    4. an executive summary
    5. hardware and software dependencies
    6. sample input and sample outputs
7. All submitted Content will be subjected to an intellectual property (IP) and vulnerability search and assessment using specialized software. **If IP or security breaches are discovered, the entrant will be notified and is required to resolve breaches within two (2) calendar weeks. Not complying with this will result in disqualification.**
8. Additional Conditions of Submission:
    1. Any code submissions shall be governed by the Apache 2.0 license reproduced below. Submissions are solely accepted under this license.
        ```
        * SPDX-FileCopyrightText: Copyright (c) <year> <name>. All rights reserved.
        * SPDX-License-Identifier: Apache-2.0
        *
        * Licensed under the Apache License, Version 2.0 (the "License");
        * you may not use this file except in compliance with the License.
        * You may obtain a copy of the License at
        *
        * http://www.apache.org/licenses/LICENSE-2.0
        *
        * Unless required by applicable law or agreed to in writing, software
        * distributed under the License is distributed on an "AS IS" BASIS,
        * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
        * See the License for the specific language governing permissions and
        * limitations under the License.
        */
        ```

    2. Signing Your Work
  
        We require that all contributors "sign-off" on their commits. This certifies that the contribution is your original work, or you have rights to submit it under the same license, or a compatible license.

        Any contribution which contains commits that are not Signed-Off will not be accepted.
    To sign off on a commit you simply use the `--signoff` (or `-s`) option when committing your changes:

        The repository will host submissions for contest to extend the set of samples that are provided with CUDA Math Libraries by crowdsourcing the creation of CUDA Samples to the developer community
        ```
        $ git commit -s -m "Add cool feature."
        This will append the following to your commit message:
        Signed-off-by: Your Name <your@email.com>
        ```
        
        Full text of the [DCO](https://developercertificate.org/):
          ```
          Developer Certificate of Origin
          Version 1.1

          Copyright (C) 2004, 2006 The Linux Foundation and its contributors.

          Everyone is permitted to copy and distribute verbatim copies of this
          license document, but changing it is not allowed.


          Developer's Certificate of Origin 1.1

          By making a contribution to this project, I certify that:

          (a) The contribution was created in whole or in part by me and I
              have the right to submit it under the open source license
              indicated in the file; or

          (b) The contribution is based upon previous work that, to the best
              of my knowledge, is covered under an appropriate open source
              license and I have the right under that license to submit that
              work with modifications, whether created in whole or in part
              by me, under the same open source license (unless I am
              permitted to submit under a different license), as indicated
              in the file; or

          (c) The contribution was provided directly to me by some other
              person who certified (a), (b) or (c) and I have not modified
              it.

          (d) I understand and agree that this project and the contribution
              are public and that a record of the contribution (including all
              personal information I submit with it, including my sign-off) is
              maintained indefinitely and may be redistributed consistent with
              this project or the open source license(s) involved.
          ```

### Judging
There will be up to 10 prizes awarded following the closure of the contest season. Prizes consist of NVIDIA Jetson Nano™ 2GB Developer Kit [SKU: 945-13541-0001-000](https://www.arrow.com/en/products/945-13541-0001-000/nvidia) units.

Each winning submission receives a prize. Winner is determined based on: uniqueness of the application sample, educational value, adherence to the challenge criteria, and compliance with IP and vulnerability audit as outlined in section 3.1.7. 

Entrants can only qualify for one (1) Jetson Nano Developer Kit per contest season. NVIDIA has the right not to award prizes or give less than 10 awards.

The winners of each one (1) Jetson Nano Developer Kit will be announced on the Contest GitHub page. Additionally, winners will be privately contacted within two (2) weeks following the closure of the entry period.  NVIDIA and the Judges will have the sole authority and discretion to select all the winners, and all decisions of NVIDIA and the Judges will be FINAL. By entering this Contest, you agree to be bound by the decisions of NVIDIA and the Judges. 


### Prizes: Odds of Winning
The prizes of this Contest are as follows: 
  * Up to ten (10) winners will receive one (1) NVIDIA Jetson Nano Developer Kit (SKU: 945-13541-0001-000) with a MSRP of $54

The prizes are not assignable or transferable. Brand and model of prizes are subject to change by NVIDIA at any time for any reason and substitutions will be of equal or greater value. NVIDIA is not responsible or liable for the distribution of any prizes once they are shipped to the winner. The prizes offered, and the entrants that are successful, are not distinguishable by country and do not hold any bias and are equally attainable for all participating countries and their entrants (within compliance of region-specific hardware). THIS CONTEST HAS NOT PREVIOUSLY BEEN OFFERED. Odds of winning depend on the number of eligible entries received.

### Entry Period
The entry period for this Contest begins at 12pm GMT (Greenwich Mean Time) on **April 15th, 2022** and ends at 6pm GMT (Greenwich Mean Time) on **July 15th, 2022** (hereinafter the “Entry Period”). A panel of NVIDIA judges will select and announce the winners of the contest **four (4) weeks following the close of the entry period**. 

### Winner Announcement: Claiming and Awarding of Prize
The winners will be announced on the [Contest GitHub page](https://github.com/gpuhackathons-org/mathlib-samples-contest) on or about August 15th, 2022. Within 14 days following such announcement, the winners will be notified by NVIDIA via email. To claim the prize, the winner must do the following within 30 days from the date of NVIDIA’s notification: 
  1. confirm receipt of the notice by email (which confirmation must be sent from the same email address to which the notice was sent); and 
  2. complete, sign and return a winner release form (as provided by NVIDIA along with its email notice) and such other requisite documentation (if any) listed in NVIDIA’s email notice 

Within 30 days following its receipt of the Required Winner Documents from the winner, NVIDIA will ship the prize via FedEx or similar courier service, at NVIDIA’s expense, to the winner’s mailing address specified in his/her winning entry. Notwithstanding the foregoing, if NVIDIA determines that the Required Winner Documents as returned by the winner are incomplete, erroneous, or otherwise not in order, NVIDIA may require the winner to provide complete or replacement documentation prior to shipment of prize. Digital prizes will be electronically emailed to the email address supplied as part of their contest submission.

**IMPORTANT NOTE TO ALL ENTRANTS:** If a winner cannot be contacted or fails to claim the prize or to return the Required Winner Documents within the specified time period, or if the prize is returned as undeliverable, or if a winner fails to comply with any of the provisions of these Official Rules, such winner will be considered to have forfeited the prize.

### Taxes
The winner of this Contest is solely responsible for any and all applicable taxes and government charges that result from his/her receipt and/or use of the prize. Sponsor reserves the right to withhold and deduct such taxes and charges from the prize if and to the extent required by law. 

### AGREEMENTS by Entrant
  1. By entering this Contest, each entrant agrees and acknowledges that Sponsor and Sponsor Related Parties shall not be responsible or liable for: (i) any late, lost, stolen, forged, mutilated, corrupted, incomplete, illegible or misdirected entries; (ii) any errors, omissions, misinformation, or misidentification in an entry; (iii) any dispute or claim arising from an entrant’s participation in this Contest or his/her entry, or his/her receipt, ownership or use of the prize; (iv) any computer hardware, software, Internet, network, cable, phone, or other communication or technical errors, failures, malfunctions, interruptions, or delays; or (v) any damage to an entrant’s or any other person’s computer hardware, software or data that results from participation in this Contest or accessing, downloading or using any tools, files, data, software, or other articles or materials in connection with this Contest. 
  2. By entering this Contest, each entrant agrees and consents to Sponsor’s collection, use and retention of his/her personal information for all purposes related to this Contest (including, without limitation, processing and administering entries, sharing an entrant’s personal information with Sponsor Related Parties as necessary to conduct and operate this Contest, communicating with and awarding the prize to the winner, making public announcements about the winner, and advertising, promoting and publicizing this Contest).
  3. ANY ENTRY THAT IS IN BREACH OF ANY OF THE FOREGOING REPRESENTATIONS AND WARRANTIES OR IS OTHERWISE IN VIOLATION OF THESE OFFICIAL RULES, WILL BE DEEMED VOID AND AUTOMATICALLY BE DISQUALIFIED FROM THIS CONTEST.
  4. By entering this Contest, Entrant irrevocably assigns to Sponsor all right, title and interest worldwide in and to the Content and all applicable intellectual property rights related to the Content, including without limitation, copyrights, trademarks, trade secrets, patents, moral rights, contract and licensing rights. 

### Reservation of Rights by SPONSOR
Sponsor reserves the right, to the extent permitted by applicable law, to terminate, cancel, modify or suspend this Contest, in whole or in part, if fraud, technical failures or any other factor beyond Sponsor’s reasonable control impairs the integrity of this Contest as determined by Sponsor in its sole discretion. If this Contest or any web site associated therewith (or any portion thereof) becomes corrupted or otherwise does not permit entry, or if infection by computer virus, bugs, tampering, unauthorized intervention, actions by entrants, fraud, technical failures, or any other causes, in Sponsor’s sole opinion, corrupt or affect the administration, security, fairness, integrity, or proper operation of this Contest, Sponsor reserves the right, at its sole discretion and to the extent permitted by applicable law, to disqualify any individual implicated in such action, and/or to cancel, terminate, cancel, modify or suspend this Contest, in whole or in part. Any attempt by an entrant or any other individual to deliberately damage any online service or web site or undermine the legitimate operation of this Contest is a violation of criminal and civil laws, and should such an attempt be made Sponsor reserves the right to seek damages and/or other remedies from any such person to the maximum extent permitted by applicable law. In addition, Sponsor reserves the right to take down and remove any entry that becomes subject to a third-party claim for copyright infringement or for violation of any other right. 

### Governing Law: Jurisdiction
These Official Rules are governed by and shall be construed in accordance with the laws of the State of Delaware, U.S.A., without giving effect to its conflicts of law rules. Each entrant hereby submits himself or herself to the exclusive jurisdiction of the state and federal courts sitting in Santa Clara, California, U.S.A.

### Contest Information
The Sponsor of this promotion is NVIDIA. The number of entries and winners will be posted at [NVIDIA Technical Blog](https://developer.nvidia.com/blog/), after 8/15/2022. 
